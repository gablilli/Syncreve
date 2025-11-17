package manager

import (
	"context"
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"sync"
	"time"

	"github.com/google/uuid"
	"github.com/xkeyC/Syncreve/pkg/database"
	"github.com/xkeyC/Syncreve/pkg/models"
	"gorm.io/gorm"
)

const (
	DefaultMaxConcurrent = 3
	DefaultChunkSize     = 1024 * 1024 * 4 // 4MB
	ProgressUpdateRate   = 500 * time.Millisecond
)

// DownloadManager manages download tasks
type DownloadManager struct {
	accountMgr     *AccountManager
	db             *gorm.DB
	maxConcurrent  int
	running        map[uuid.UUID]*runningDownload
	runningMu      sync.RWMutex
	queue          chan uuid.UUID
	ctx            context.Context
	cancel         context.CancelFunc
	wg             sync.WaitGroup
	statusWatchers []chan *database.DownloadTask
	watchersMu     sync.RWMutex
}

type runningDownload struct {
	task       *database.DownloadTask
	cancel     context.CancelFunc
	lastUpdate time.Time
	lastSize   int64
}

// NewDownloadManager creates a new download manager
func NewDownloadManager(accountMgr *AccountManager, db *gorm.DB, maxConcurrent int) *DownloadManager {
	if maxConcurrent <= 0 {
		maxConcurrent = DefaultMaxConcurrent
	}

	ctx, cancel := context.WithCancel(context.Background())

	dm := &DownloadManager{
		accountMgr:    accountMgr,
		db:            db,
		maxConcurrent: maxConcurrent,
		running:       make(map[uuid.UUID]*runningDownload),
		queue:         make(chan uuid.UUID, 100),
		ctx:           ctx,
		cancel:        cancel,
	}

	// Start worker pool
	for i := 0; i < maxConcurrent; i++ {
		dm.wg.Add(1)
		go dm.worker()
	}

	// Resume pending tasks
	go dm.resumePendingTasks()

	return dm
}

// AddTask adds a new download task
func (dm *DownloadManager) AddTask(ctx context.Context, accountID uuid.UUID, fileID, fileName, uri, savePath string, taskType database.TaskType) (uuid.UUID, error) {
	task := &database.DownloadTask{
		AccountID: accountID,
		FileID:    fileID,
		FileName:  fileName,
		URI:       uri,
		SavePath:  savePath,
		Status:    database.TaskStatusWaiting,
		Type:      taskType,
	}

	if err := dm.db.Create(task).Error; err != nil {
		return uuid.Nil, err
	}

	// Add to queue
	select {
	case dm.queue <- task.ID:
	case <-ctx.Done():
		return uuid.Nil, ctx.Err()
	}

	return task.ID, nil
}

// AddTasksByDir adds download tasks for all files in a directory
func (dm *DownloadManager) AddTasksByDir(ctx context.Context, accountID uuid.UUID, dirPath, savePath string, taskType database.TaskType) ([]uuid.UUID, error) {
	// List all files in directory recursively
	files, err := dm.listDirRecursive(ctx, accountID, dirPath)
	if err != nil {
		return nil, err
	}

	var taskIDs []uuid.UUID
	for _, file := range files {
		if file.Type == models.FileTypeFile {
			// Calculate relative path
			relPath := file.Path[len(dirPath):]
			taskSavePath := filepath.Join(savePath, relPath)
			taskSaveDir := filepath.Dir(taskSavePath)

			taskID, err := dm.AddTask(ctx, accountID, file.ID, file.Name, file.Path, taskSaveDir, taskType)
			if err != nil {
				return taskIDs, err
			}
			taskIDs = append(taskIDs, taskID)
		}
	}

	return taskIDs, nil
}

func (dm *DownloadManager) listDirRecursive(ctx context.Context, accountID uuid.UUID, dirPath string) ([]*models.FileResponse, error) {
	var allFiles []*models.FileResponse

	client, err := dm.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, err
	}

	var walkDir func(string) error
	walkDir = func(path string) error {
		resp, err := client.ListFiles(ctx, &models.ListFileRequest{
			URI: path,
		})
		if err != nil {
			return err
		}

		for _, file := range resp.Files {
			if file.Type == models.FileTypeFolder {
				// Recurse into subdirectory
				if err := walkDir(file.Path); err != nil {
					return err
				}
			} else {
				allFiles = append(allFiles, &file)
			}
		}
		return nil
	}

	if err := walkDir(dirPath); err != nil {
		return nil, err
	}

	return allFiles, nil
}

// CancelTask cancels a download task
func (dm *DownloadManager) CancelTask(taskID uuid.UUID) error {
	dm.runningMu.Lock()
	rd, exists := dm.running[taskID]
	if exists {
		rd.cancel()
		delete(dm.running, taskID)
	}
	dm.runningMu.Unlock()

	// Update task status
	return dm.db.Model(&database.DownloadTask{}).
		Where("id = ?", taskID).
		Updates(map[string]interface{}{
			"status": database.TaskStatusCancelled,
		}).Error
}

// PauseTask pauses a download task
func (dm *DownloadManager) PauseTask(taskID uuid.UUID) error {
	dm.runningMu.Lock()
	rd, exists := dm.running[taskID]
	if exists {
		rd.cancel()
		delete(dm.running, taskID)
	}
	dm.runningMu.Unlock()

	return dm.db.Model(&database.DownloadTask{}).
		Where("id = ?", taskID).
		Updates(map[string]interface{}{
			"status": database.TaskStatusPaused,
		}).Error
}

// ResumeTask resumes a paused download task
func (dm *DownloadManager) ResumeTask(taskID uuid.UUID) error {
	err := dm.db.Model(&database.DownloadTask{}).
		Where("id = ? AND status = ?", taskID, database.TaskStatusPaused).
		Updates(map[string]interface{}{
			"status": database.TaskStatusWaiting,
		}).Error
	if err != nil {
		return err
	}

	// Add back to queue
	select {
	case dm.queue <- taskID:
	case <-dm.ctx.Done():
		return dm.ctx.Err()
	}

	return nil
}

// RetryTask retries a failed task
func (dm *DownloadManager) RetryTask(taskID uuid.UUID) error {
	err := dm.db.Model(&database.DownloadTask{}).
		Where("id = ? AND status = ?", taskID, database.TaskStatusFailed).
		Updates(map[string]interface{}{
			"status":          database.TaskStatusWaiting,
			"error":           "",
			"downloaded_size": 0,
			"progress":        0,
		}).Error
	if err != nil {
		return err
	}

	// Add back to queue
	select {
	case dm.queue <- taskID:
	case <-dm.ctx.Done():
		return dm.ctx.Err()
	}

	return nil
}

// GetTask gets a download task by ID
func (dm *DownloadManager) GetTask(taskID uuid.UUID) (*database.DownloadTask, error) {
	var task database.DownloadTask
	err := dm.db.First(&task, "id = ?", taskID).Error
	if err != nil {
		return nil, err
	}

	// Update with real-time info if running
	dm.runningMu.RLock()
	if rd, exists := dm.running[taskID]; exists {
		task.DownloadedSize = rd.task.DownloadedSize
		task.Speed = rd.task.Speed
		task.Progress = rd.task.Progress
	}
	dm.runningMu.RUnlock()

	return &task, nil
}

// ListTasks lists download tasks with filters
func (dm *DownloadManager) ListTasks(status *database.TaskStatus, taskType *database.TaskType, page, perPage int) ([]*database.DownloadTask, int64, error) {
	query := dm.db.Model(&database.DownloadTask{})

	if status != nil {
		query = query.Where("status = ?", *status)
	}
	if taskType != nil {
		query = query.Where("type = ?", *taskType)
	}

	var total int64
	if err := query.Count(&total).Error; err != nil {
		return nil, 0, err
	}

	if page > 0 && perPage > 0 {
		offset := (page - 1) * perPage
		query = query.Offset(offset).Limit(perPage)
	}

	var tasks []*database.DownloadTask
	err := query.Order("created_at DESC").Find(&tasks).Error
	if err != nil {
		return nil, 0, err
	}

	// Update with real-time info if running
	dm.runningMu.RLock()
	for _, task := range tasks {
		if rd, exists := dm.running[task.ID]; exists {
			task.DownloadedSize = rd.task.DownloadedSize
			task.Speed = rd.task.Speed
			task.Progress = rd.task.Progress
		}
	}
	dm.runningMu.RUnlock()

	return tasks, total, nil
}

// ClearCompleted clears all completed tasks
func (dm *DownloadManager) ClearCompleted() (int64, error) {
	result := dm.db.Where("status = ?", database.TaskStatusCompleted).Delete(&database.DownloadTask{})
	return result.RowsAffected, result.Error
}

// GetStats gets download statistics
func (dm *DownloadManager) GetStats() (*DownloadStats, error) {
	stats := &DownloadStats{}

	dm.db.Model(&database.DownloadTask{}).Count(&stats.Total)
	dm.db.Model(&database.DownloadTask{}).Where("status = ?", database.TaskStatusWaiting).Count(&stats.Waiting)
	dm.db.Model(&database.DownloadTask{}).Where("status = ?", database.TaskStatusRunning).Count(&stats.Downloading)
	dm.db.Model(&database.DownloadTask{}).Where("status = ?", database.TaskStatusCompleted).Count(&stats.Completed)
	dm.db.Model(&database.DownloadTask{}).Where("status = ?", database.TaskStatusFailed).Count(&stats.Failed)

	// Calculate total downloaded size
	var totalSize struct {
		Size int64
	}
	dm.db.Model(&database.DownloadTask{}).
		Select("COALESCE(SUM(downloaded_size), 0) as size").
		Where("status = ?", database.TaskStatusCompleted).
		Scan(&totalSize)
	stats.TotalDownloadedSize = float64(totalSize.Size)

	// Calculate current speed
	dm.runningMu.RLock()
	for _, rd := range dm.running {
		stats.CurrentSpeed += rd.task.Speed
	}
	dm.runningMu.RUnlock()

	return stats, nil
}

// WatchStatus subscribes to task status updates
func (dm *DownloadManager) WatchStatus() chan *database.DownloadTask {
	ch := make(chan *database.DownloadTask, 10)
	dm.watchersMu.Lock()
	dm.statusWatchers = append(dm.statusWatchers, ch)
	dm.watchersMu.Unlock()
	return ch
}

// UnwatchStatus unsubscribes from task status updates
func (dm *DownloadManager) UnwatchStatus(ch chan *database.DownloadTask) {
	dm.watchersMu.Lock()
	defer dm.watchersMu.Unlock()

	for i, watcher := range dm.statusWatchers {
		if watcher == ch {
			dm.statusWatchers = append(dm.statusWatchers[:i], dm.statusWatchers[i+1:]...)
			close(ch)
			break
		}
	}
}

// Close stops the download manager
func (dm *DownloadManager) Close() error {
	dm.cancel()
	dm.wg.Wait()

	// Close all watchers
	dm.watchersMu.Lock()
	for _, ch := range dm.statusWatchers {
		close(ch)
	}
	dm.statusWatchers = nil
	dm.watchersMu.Unlock()

	return nil
}

func (dm *DownloadManager) worker() {
	defer dm.wg.Done()

	for {
		select {
		case <-dm.ctx.Done():
			return
		case taskID := <-dm.queue:
			dm.processTask(taskID)
		}
	}
}

func (dm *DownloadManager) processTask(taskID uuid.UUID) {
	var task database.DownloadTask
	if err := dm.db.First(&task, "id = ?", taskID).Error; err != nil {
		return
	}

	// Skip if not in waiting status
	if task.Status != database.TaskStatusWaiting {
		return
	}

	// Update status to running
	task.Status = database.TaskStatusRunning
	if err := dm.db.Save(&task).Error; err != nil {
		return
	}

	// Create cancellable context
	ctx, cancel := context.WithCancel(dm.ctx)
	rd := &runningDownload{
		task:       &task,
		cancel:     cancel,
		lastUpdate: time.Now(),
	}

	dm.runningMu.Lock()
	dm.running[taskID] = rd
	dm.runningMu.Unlock()

	// Download file
	err := dm.downloadFile(ctx, &task, rd)

	// Update final status
	dm.runningMu.Lock()
	delete(dm.running, taskID)
	dm.runningMu.Unlock()

	now := time.Now()
	if err != nil {
		task.Status = database.TaskStatusFailed
		task.Error = err.Error()
	} else {
		task.Status = database.TaskStatusCompleted
		task.Progress = 100
		task.CompletedAt = &now
	}

	dm.db.Save(&task)
	dm.notifyWatchers(&task)
}

func (dm *DownloadManager) downloadFile(ctx context.Context, task *database.DownloadTask, rd *runningDownload) error {
	// Get client for this task's account
	client, err := dm.accountMgr.GetClient(task.AccountID)
	if err != nil {
		return err
	}

	// Get download URL
	download := true
	urlResp, err := client.GetFileURL(ctx, &models.FileURLRequest{
		URIs:     []string{task.URI},
		Download: &download,
	})
	if err != nil {
		return err
	}

	// Create save directory
	if err := os.MkdirAll(task.SavePath, 0755); err != nil {
		return err
	}

	filePath := filepath.Join(task.SavePath, task.FileName)
	tempPath := filePath + ".downloading"

	// Check if file already exists
	if _, err := os.Stat(filePath); err == nil {
		return fmt.Errorf("file already exists: %s", filePath)
	}

	// Create temporary file
	out, err := os.Create(tempPath)
	if err != nil {
		return err
	}
	defer out.Close()

	if len(urlResp.URLs) == 0 {
		return fmt.Errorf("no download URL returned")
	}

	// Download file
	req, err := http.NewRequestWithContext(ctx, "GET", urlResp.URLs[0].URL, nil)
	if err != nil {
		return err
	}

	// Add auth header if available
	if token := client.GetAccessToken(); token != "" {
		req.Header.Set("Authorization", "Bearer "+token)
	}

	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("download failed with status: %d", resp.StatusCode)
	}

	// Update total size
	task.TotalSize = resp.ContentLength
	dm.db.Model(task).Update("total_size", task.TotalSize)

	// Download with progress tracking
	buf := make([]byte, DefaultChunkSize)
	lastUpdate := time.Now()

	for {
		n, err := resp.Body.Read(buf)
		if n > 0 {
			if _, writeErr := out.Write(buf[:n]); writeErr != nil {
				return writeErr
			}

			task.DownloadedSize += int64(n)

			// Update progress periodically
			now := time.Now()
			if now.Sub(lastUpdate) >= ProgressUpdateRate {
				elapsed := now.Sub(lastUpdate).Seconds()
				if elapsed > 0 {
					task.Speed = float64(task.DownloadedSize-rd.lastSize) / elapsed
				}
				if task.TotalSize > 0 {
					task.Progress = float64(task.DownloadedSize) / float64(task.TotalSize) * 100
				}

				dm.db.Model(task).Updates(map[string]interface{}{
					"downloaded_size": task.DownloadedSize,
					"speed":           task.Speed,
					"progress":        task.Progress,
				})
				dm.notifyWatchers(task)

				lastUpdate = now
				rd.lastSize = task.DownloadedSize
			}
		}

		if err == io.EOF {
			break
		}
		if err != nil {
			return err
		}

		// Check for cancellation
		select {
		case <-ctx.Done():
			return ctx.Err()
		default:
		}
	}

	// Rename temp file to final name
	if err := os.Rename(tempPath, filePath); err != nil {
		return err
	}

	return nil
}

func (dm *DownloadManager) resumePendingTasks() {
	var tasks []database.DownloadTask
	dm.db.Where("status = ?", database.TaskStatusWaiting).Find(&tasks)

	for _, task := range tasks {
		select {
		case dm.queue <- task.ID:
		case <-dm.ctx.Done():
			return
		}
	}
}

func (dm *DownloadManager) notifyWatchers(task *database.DownloadTask) {
	dm.watchersMu.RLock()
	defer dm.watchersMu.RUnlock()

	for _, ch := range dm.statusWatchers {
		select {
		case ch <- task:
		default:
			// Skip if channel is full
		}
	}
}

type DownloadStats struct {
	Total               int64
	Waiting             int64
	Downloading         int64
	Completed           int64
	Failed              int64
	TotalDownloadedSize float64
	CurrentSpeed        float64
}
