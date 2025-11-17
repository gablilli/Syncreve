package manager

import (
	"context"
	"fmt"
	"io"
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
	DefaultUploadChunkSize = 1024 * 1024 * 5 // 5MB per chunk
)

// UploadManager manages upload tasks
type UploadManager struct {
	accountMgr     *AccountManager
	db             *gorm.DB
	maxConcurrent  int
	running        map[uuid.UUID]*runningUpload
	runningMu      sync.RWMutex
	queue          chan uuid.UUID
	ctx            context.Context
	cancel         context.CancelFunc
	wg             sync.WaitGroup
	statusWatchers []chan *database.UploadTask
	watchersMu     sync.RWMutex
}

type runningUpload struct {
	task       *database.UploadTask
	cancel     context.CancelFunc
	lastUpdate time.Time
	lastSize   int64
}

// NewUploadManager creates a new upload manager
func NewUploadManager(accountMgr *AccountManager, db *gorm.DB, maxConcurrent int) *UploadManager {
	if maxConcurrent <= 0 {
		maxConcurrent = DefaultMaxConcurrent
	}

	ctx, cancel := context.WithCancel(context.Background())

	um := &UploadManager{
		accountMgr:    accountMgr,
		db:            db,
		maxConcurrent: maxConcurrent,
		running:       make(map[uuid.UUID]*runningUpload),
		queue:         make(chan uuid.UUID, 100),
		ctx:           ctx,
		cancel:        cancel,
	}

	// Start worker pool
	for i := 0; i < maxConcurrent; i++ {
		um.wg.Add(1)
		go um.worker()
	}

	// Resume pending tasks
	go um.resumePendingTasks()

	return um
}

// AddTask adds a new upload task
func (um *UploadManager) AddTask(ctx context.Context, accountID uuid.UUID, localPath, remotePath string, overwrite bool) (uuid.UUID, error) {
	// Get file info
	fileInfo, err := os.Stat(localPath)
	if err != nil {
		return uuid.Nil, err
	}

	if fileInfo.IsDir() {
		return uuid.Nil, fmt.Errorf("cannot upload directory, use AddBatchTasks instead")
	}

	task := &database.UploadTask{
		AccountID:  accountID,
		LocalPath:  localPath,
		RemotePath: remotePath,
		FileName:   filepath.Base(localPath),
		TotalSize:  fileInfo.Size(),
		Status:     database.TaskStatusWaiting,
	}

	if err := um.db.Create(task).Error; err != nil {
		return uuid.Nil, err
	}

	// Add to queue
	select {
	case um.queue <- task.ID:
	case <-ctx.Done():
		return uuid.Nil, ctx.Err()
	}

	return task.ID, nil
}

// AddBatchTasks adds multiple upload tasks
func (um *UploadManager) AddBatchTasks(ctx context.Context, accountID uuid.UUID, files []string, remoteBasePath string, overwrite bool) ([]uuid.UUID, error) {
	var taskIDs []uuid.UUID

	for _, localPath := range files {
		// Check if it's a file or directory
		fileInfo, err := os.Stat(localPath)
		if err != nil {
			return taskIDs, err
		}

		if fileInfo.IsDir() {
			// Walk directory and add all files
			err := filepath.Walk(localPath, func(path string, info os.FileInfo, err error) error {
				if err != nil {
					return err
				}
				if !info.IsDir() {
					relPath, _ := filepath.Rel(localPath, path)
					remotePath := filepath.Join(remoteBasePath, relPath)
					remotePath = filepath.ToSlash(remotePath) // Convert to forward slashes

					taskID, err := um.AddTask(ctx, accountID, path, filepath.Dir(remotePath), overwrite)
					if err != nil {
						return err
					}
					taskIDs = append(taskIDs, taskID)
				}
				return nil
			})
			if err != nil {
				return taskIDs, err
			}
		} else {
			taskID, err := um.AddTask(ctx, accountID, localPath, remoteBasePath, overwrite)
			if err != nil {
				return taskIDs, err
			}
			taskIDs = append(taskIDs, taskID)
		}
	}

	return taskIDs, nil
}

// CancelTask cancels an upload task
func (um *UploadManager) CancelTask(taskID uuid.UUID) error {
	um.runningMu.Lock()
	ru, exists := um.running[taskID]
	if exists {
		ru.cancel()
		delete(um.running, taskID)
	}
	um.runningMu.Unlock()

	return um.db.Model(&database.UploadTask{}).
		Where("id = ?", taskID).
		Updates(map[string]interface{}{
			"status": database.TaskStatusCancelled,
		}).Error
}

// PauseTask pauses an upload task
func (um *UploadManager) PauseTask(taskID uuid.UUID) error {
	um.runningMu.Lock()
	ru, exists := um.running[taskID]
	if exists {
		ru.cancel()
		delete(um.running, taskID)
	}
	um.runningMu.Unlock()

	return um.db.Model(&database.UploadTask{}).
		Where("id = ?", taskID).
		Updates(map[string]interface{}{
			"status": database.TaskStatusPaused,
		}).Error
}

// ResumeTask resumes a paused upload task
func (um *UploadManager) ResumeTask(taskID uuid.UUID) error {
	err := um.db.Model(&database.UploadTask{}).
		Where("id = ? AND status = ?", taskID, database.TaskStatusPaused).
		Updates(map[string]interface{}{
			"status": database.TaskStatusWaiting,
		}).Error
	if err != nil {
		return err
	}

	// Add back to queue
	select {
	case um.queue <- taskID:
	case <-um.ctx.Done():
		return um.ctx.Err()
	}

	return nil
}

// RetryTask retries a failed task
func (um *UploadManager) RetryTask(taskID uuid.UUID) error {
	err := um.db.Model(&database.UploadTask{}).
		Where("id = ? AND status = ?", taskID, database.TaskStatusFailed).
		Updates(map[string]interface{}{
			"status":        database.TaskStatusWaiting,
			"error":         "",
			"uploaded_size": 0,
			"progress":      0,
			"session_id":    "",
		}).Error
	if err != nil {
		return err
	}

	// Add back to queue
	select {
	case um.queue <- taskID:
	case <-um.ctx.Done():
		return um.ctx.Err()
	}

	return nil
}

// GetTask gets an upload task by ID
func (um *UploadManager) GetTask(taskID uuid.UUID) (*database.UploadTask, error) {
	var task database.UploadTask
	err := um.db.First(&task, "id = ?", taskID).Error
	if err != nil {
		return nil, err
	}

	// Update with real-time info if running
	um.runningMu.RLock()
	if ru, exists := um.running[taskID]; exists {
		task.UploadedSize = ru.task.UploadedSize
		task.Speed = ru.task.Speed
		task.Progress = ru.task.Progress
	}
	um.runningMu.RUnlock()

	return &task, nil
}

// ListTasks lists upload tasks with filters
func (um *UploadManager) ListTasks(status *database.TaskStatus, page, perPage int) ([]*database.UploadTask, int64, error) {
	query := um.db.Model(&database.UploadTask{})

	if status != nil {
		query = query.Where("status = ?", *status)
	}

	var total int64
	if err := query.Count(&total).Error; err != nil {
		return nil, 0, err
	}

	if page > 0 && perPage > 0 {
		offset := (page - 1) * perPage
		query = query.Offset(offset).Limit(perPage)
	}

	var tasks []*database.UploadTask
	err := query.Order("created_at DESC").Find(&tasks).Error
	if err != nil {
		return nil, 0, err
	}

	// Update with real-time info if running
	um.runningMu.RLock()
	for _, task := range tasks {
		if ru, exists := um.running[task.ID]; exists {
			task.UploadedSize = ru.task.UploadedSize
			task.Speed = ru.task.Speed
			task.Progress = ru.task.Progress
		}
	}
	um.runningMu.RUnlock()

	return tasks, total, nil
}

// ClearCompleted clears all completed tasks
func (um *UploadManager) ClearCompleted() (int64, error) {
	result := um.db.Where("status = ?", database.TaskStatusCompleted).Delete(&database.UploadTask{})
	return result.RowsAffected, result.Error
}

// GetStats gets upload statistics
func (um *UploadManager) GetStats() (*UploadStats, error) {
	stats := &UploadStats{}

	um.db.Model(&database.UploadTask{}).Count(&stats.Total)
	um.db.Model(&database.UploadTask{}).Where("status = ?", database.TaskStatusWaiting).Count(&stats.Waiting)
	um.db.Model(&database.UploadTask{}).Where("status = ?", database.TaskStatusRunning).Count(&stats.Uploading)
	um.db.Model(&database.UploadTask{}).Where("status = ?", database.TaskStatusCompleted).Count(&stats.Completed)
	um.db.Model(&database.UploadTask{}).Where("status = ?", database.TaskStatusFailed).Count(&stats.Failed)

	// Calculate total uploaded size
	var totalSize struct {
		Size int64
	}
	um.db.Model(&database.UploadTask{}).
		Select("COALESCE(SUM(uploaded_size), 0) as size").
		Where("status = ?", database.TaskStatusCompleted).
		Scan(&totalSize)
	stats.TotalUploadedSize = float64(totalSize.Size)

	// Calculate current speed
	um.runningMu.RLock()
	for _, ru := range um.running {
		stats.CurrentSpeed += ru.task.Speed
	}
	um.runningMu.RUnlock()

	return stats, nil
}

// WatchStatus subscribes to task status updates
func (um *UploadManager) WatchStatus() chan *database.UploadTask {
	ch := make(chan *database.UploadTask, 10)
	um.watchersMu.Lock()
	um.statusWatchers = append(um.statusWatchers, ch)
	um.watchersMu.Unlock()
	return ch
}

// UnwatchStatus unsubscribes from task status updates
func (um *UploadManager) UnwatchStatus(ch chan *database.UploadTask) {
	um.watchersMu.Lock()
	defer um.watchersMu.Unlock()

	for i, watcher := range um.statusWatchers {
		if watcher == ch {
			um.statusWatchers = append(um.statusWatchers[:i], um.statusWatchers[i+1:]...)
			close(ch)
			break
		}
	}
}

// Close stops the upload manager
func (um *UploadManager) Close() error {
	um.cancel()
	um.wg.Wait()

	// Close all watchers
	um.watchersMu.Lock()
	for _, ch := range um.statusWatchers {
		close(ch)
	}
	um.statusWatchers = nil
	um.watchersMu.Unlock()

	return nil
}

func (um *UploadManager) worker() {
	defer um.wg.Done()

	for {
		select {
		case <-um.ctx.Done():
			return
		case taskID := <-um.queue:
			um.processTask(taskID)
		}
	}
}

func (um *UploadManager) processTask(taskID uuid.UUID) {
	var task database.UploadTask
	if err := um.db.First(&task, "id = ?", taskID).Error; err != nil {
		return
	}

	// Skip if not in waiting status
	if task.Status != database.TaskStatusWaiting {
		return
	}

	// Update status to running
	task.Status = database.TaskStatusRunning
	if err := um.db.Save(&task).Error; err != nil {
		return
	}

	// Create cancellable context
	ctx, cancel := context.WithCancel(um.ctx)
	ru := &runningUpload{
		task:       &task,
		cancel:     cancel,
		lastUpdate: time.Now(),
	}

	um.runningMu.Lock()
	um.running[taskID] = ru
	um.runningMu.Unlock()

	// Upload file
	err := um.uploadFile(ctx, &task, ru)

	// Update final status
	um.runningMu.Lock()
	delete(um.running, taskID)
	um.runningMu.Unlock()

	now := time.Now()
	if err != nil {
		task.Status = database.TaskStatusFailed
		task.Error = err.Error()
	} else {
		task.Status = database.TaskStatusCompleted
		task.Progress = 100
		task.CompletedAt = &now
	}

	um.db.Save(&task)
	um.notifyWatchers(&task)
}

func (um *UploadManager) uploadFile(ctx context.Context, task *database.UploadTask, ru *runningUpload) error {
	// Get client for this task's account
	client, err := um.accountMgr.GetClient(task.AccountID)
	if err != nil {
		return err
	}

	// Open local file
	file, err := os.Open(task.LocalPath)
	if err != nil {
		return err
	}
	defer file.Close()

	// Get file size
	fileInfo, err := file.Stat()
	if err != nil {
		return err
	}
	fileSize := fileInfo.Size()

	// Create upload session
	session, err := client.CreateUploadSession(ctx, &models.UploadSessionRequest{
		URI:      task.RemotePath + "/" + task.FileName,
		Size:     fileSize,
		PolicyID: "", // Will be determined by server
	})
	if err != nil {
		return err
	}

	task.SessionID = session.SessionID
	um.db.Model(task).Update("session_id", session.SessionID)

	// Upload in chunks
	chunkSize := int64(DefaultUploadChunkSize)
	totalChunks := (fileSize + chunkSize - 1) / chunkSize

	lastUpdate := time.Now()

	for i := int64(0); i < totalChunks; i++ {
		// Read chunk
		chunk := make([]byte, chunkSize)
		n, err := file.Read(chunk)
		if err != nil && err != io.EOF {
			return err
		}
		chunk = chunk[:n]

		// Upload chunk
		_, err = client.UploadChunk(ctx, session.SessionID, chunk, int(i))
		if err != nil {
			return err
		}

		task.UploadedSize += int64(n)

		// Update progress periodically
		now := time.Now()
		if now.Sub(lastUpdate) >= ProgressUpdateRate {
			elapsed := now.Sub(lastUpdate).Seconds()
			if elapsed > 0 {
				task.Speed = float64(task.UploadedSize-ru.lastSize) / elapsed
			}
			task.Progress = float64(task.UploadedSize) / float64(task.TotalSize) * 100

			um.db.Model(task).Updates(map[string]interface{}{
				"uploaded_size": task.UploadedSize,
				"speed":         task.Speed,
				"progress":      task.Progress,
			})
			um.notifyWatchers(task)

			lastUpdate = now
			ru.lastSize = task.UploadedSize
		}

		// Check for cancellation
		select {
		case <-ctx.Done():
			// Try to delete the upload session
			_ = client.DeleteUploadSession(ctx, &models.DeleteUploadSessionRequest{
				ID:  session.SessionID,
				URI: task.RemotePath + "/" + task.FileName,
			})
			return ctx.Err()
		default:
		}
	}

	return nil
}

func (um *UploadManager) resumePendingTasks() {
	var tasks []database.UploadTask
	um.db.Where("status = ?", database.TaskStatusWaiting).Find(&tasks)

	for _, task := range tasks {
		select {
		case um.queue <- task.ID:
		case <-um.ctx.Done():
			return
		}
	}
}

func (um *UploadManager) notifyWatchers(task *database.UploadTask) {
	um.watchersMu.RLock()
	defer um.watchersMu.RUnlock()

	for _, ch := range um.statusWatchers {
		select {
		case ch <- task:
		default:
			// Skip if channel is full
		}
	}
}

type UploadStats struct {
	Total             int64
	Waiting           int64
	Uploading         int64
	Completed         int64
	Failed            int64
	TotalUploadedSize float64
	CurrentSpeed      float64
}
