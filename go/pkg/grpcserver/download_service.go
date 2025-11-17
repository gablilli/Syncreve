package grpcserver

import (
	"context"

	"github.com/google/uuid"
	"github.com/xkeyC/Syncreve/pkg/database"
	pb "github.com/xkeyC/Syncreve/pkg/grpc/protos"
	"github.com/xkeyC/Syncreve/pkg/manager"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type downloadService struct {
	pb.UnimplementedDownloadServiceServer
	accountMgr *manager.AccountManager
	manager    *manager.DownloadManager
}

func strPtr(s string) *string {
	return &s
}

func (d *downloadService) AddTask(ctx context.Context, req *pb.AddDownloadTaskRequest) (*pb.AddDownloadTaskResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	var taskIDs []string

	taskType := convertTaskType(req.Type)
	for _, file := range req.Files {
		uri := file.Uri
		if uri == nil {
			uri = strPtr("")
		}

		taskID, err := d.manager.AddTask(ctx, accountID, file.FileId, file.FileName, *uri, req.SavePath, taskType)
		if err != nil {
			return nil, status.Error(codes.Internal, err.Error())
		}
		taskIDs = append(taskIDs, taskID.String())
	}

	return &pb.AddDownloadTaskResponse{
		TaskIds: taskIDs,
	}, nil
}

func (d *downloadService) AddTasksByDir(ctx context.Context, req *pb.AddDownloadTasksByDirRequest) (*pb.AddDownloadTaskResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	taskType := convertTaskType(req.Type)

	taskIDs, err := d.manager.AddTasksByDir(ctx, accountID, req.DirPath, req.SavePath, taskType)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var taskIDStrs []string
	for _, id := range taskIDs {
		taskIDStrs = append(taskIDStrs, id.String())
	}

	return &pb.AddDownloadTaskResponse{
		TaskIds: taskIDStrs,
	}, nil
}

func (d *downloadService) CancelTask(ctx context.Context, req *pb.CancelTaskRequest) (*pb.CancelTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		errMsg := "invalid task ID"
		return &pb.CancelTaskResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	err = d.manager.CancelTask(taskID)
	if err != nil {
		errMsg := err.Error()
		return &pb.CancelTaskResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.CancelTaskResponse{
		Success: true,
	}, nil
}

func (d *downloadService) GetTaskInfo(ctx context.Context, req *pb.GetTaskInfoRequest) (*pb.TaskInfoResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid task ID")
	}

	task, err := d.manager.GetTask(taskID)
	if err != nil {
		return nil, status.Error(codes.NotFound, err.Error())
	}

	return &pb.TaskInfoResponse{
		Task: convertDownloadTask(task),
	}, nil
}

func (d *downloadService) ListTasks(ctx context.Context, req *pb.ListTasksRequest) (*pb.ListTasksResponse, error) {
	var statusFilter *database.TaskStatus
	var typeFilter *database.TaskType

	if req.Status != nil {
		s := convertPBTaskStatus(*req.Status)
		statusFilter = &s
	}
	if req.Type != nil {
		t := convertPBTaskType(*req.Type)
		typeFilter = &t
	}

	page := int(req.GetPage())
	perPage := int(req.GetPerPage())

	tasks, total, err := d.manager.ListTasks(statusFilter, typeFilter, page, perPage)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var pbTasks []*pb.DownloadTaskInfo
	for _, task := range tasks {
		pbTasks = append(pbTasks, convertDownloadTask(task))
	}

	return &pb.ListTasksResponse{
		Tasks: pbTasks,
		Total: total,
	}, nil
}

func (d *downloadService) WatchTaskStatus(req *pb.WatchTaskStatusRequest, stream pb.DownloadService_WatchTaskStatusServer) error {
	watcher := d.manager.WatchStatus()
	defer d.manager.UnwatchStatus(watcher)

	for {
		select {
		case task, ok := <-watcher:
			if !ok {
				return nil
			}

			// Filter by task ID if specified
			if req.TaskId != nil && task.ID.String() != *req.TaskId {
				continue
			}

			err := stream.Send(&pb.TaskStatusUpdate{
				Task: convertDownloadTask(task),
			})
			if err != nil {
				return err
			}
		case <-stream.Context().Done():
			return nil
		}
	}
}

func (d *downloadService) PauseTask(ctx context.Context, req *pb.PauseTaskRequest) (*pb.PauseTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.PauseTaskResponse{Success: false}, nil
	}

	err = d.manager.PauseTask(taskID)
	return &pb.PauseTaskResponse{Success: err == nil}, nil
}

func (d *downloadService) ResumeTask(ctx context.Context, req *pb.ResumeTaskRequest) (*pb.ResumeTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.ResumeTaskResponse{Success: false}, nil
	}

	err = d.manager.ResumeTask(taskID)
	return &pb.ResumeTaskResponse{Success: err == nil}, nil
}

func (d *downloadService) RetryTask(ctx context.Context, req *pb.RetryTaskRequest) (*pb.RetryTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.RetryTaskResponse{Success: false}, nil
	}

	err = d.manager.RetryTask(taskID)
	return &pb.RetryTaskResponse{
		Success:   err == nil,
		NewTaskId: &req.TaskId,
	}, nil
}

func (d *downloadService) ClearCompleted(ctx context.Context, req *pb.ClearCompletedRequest) (*pb.ClearCompletedResponse, error) {
	count, err := d.manager.ClearCompleted()
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.ClearCompletedResponse{
		ClearedCount: int32(count),
	}, nil
}

func (d *downloadService) GetStats(ctx context.Context, req *pb.GetStatsRequest) (*pb.StatsResponse, error) {
	stats, err := d.manager.GetStats()
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.StatsResponse{
		TotalTasks:          stats.Total,
		WaitingTasks:        stats.Waiting,
		DownloadingTasks:    stats.Downloading,
		CompletedTasks:      stats.Completed,
		FailedTasks:         stats.Failed,
		TotalDownloadedSize: stats.TotalDownloadedSize,
		CurrentSpeed:        stats.CurrentSpeed,
	}, nil
}

func convertDownloadTask(task *database.DownloadTask) *pb.DownloadTaskInfo {
	if task == nil {
		return nil
	}

	pbTask := &pb.DownloadTaskInfo{
		Id:             task.ID.String(),
		FileId:         task.FileID,
		FileName:       task.FileName,
		SavePath:       task.SavePath,
		TotalSize:      task.TotalSize,
		DownloadedSize: task.DownloadedSize,
		Status:         convertTaskStatusToPB(task.Status),
		Type:           convertTaskTypeToPB(task.Type),
		Error:          task.Error,
		CreatedAt:      task.CreatedAt.Format("2006-01-02T15:04:05Z"),
		UpdatedAt:      task.UpdatedAt.Format("2006-01-02T15:04:05Z"),
	}

	if task.CompletedAt != nil {
		completedAt := task.CompletedAt.Format("2006-01-02T15:04:05Z")
		pbTask.CompletedAt = &completedAt
	}
	if task.Speed > 0 {
		pbTask.Speed = &task.Speed
	}
	if task.Progress > 0 {
		pbTask.Progress = &task.Progress
	}

	return pbTask
}

func convertTaskType(pbType pb.TaskType) database.TaskType {
	switch pbType {
	case pb.TaskType_NORMAL:
		return database.TaskTypeNormal
	case pb.TaskType_BATCH:
		return database.TaskTypeBatch
	case pb.TaskType_SYNC:
		return database.TaskTypeSync
	default:
		return database.TaskTypeNormal
	}
}

func convertTaskTypeToPB(t database.TaskType) pb.TaskType {
	switch t {
	case database.TaskTypeNormal:
		return pb.TaskType_NORMAL
	case database.TaskTypeBatch:
		return pb.TaskType_BATCH
	case database.TaskTypeSync:
		return pb.TaskType_SYNC
	default:
		return pb.TaskType_NORMAL
	}
}

func convertPBTaskType(pbType pb.TaskType) database.TaskType {
	return convertTaskType(pbType)
}

func convertTaskStatusToPB(s database.TaskStatus) pb.TaskStatus {
	switch s {
	case database.TaskStatusWaiting:
		return pb.TaskStatus_WAITING
	case database.TaskStatusRunning:
		return pb.TaskStatus_DOWNLOADING
	case database.TaskStatusPaused:
		return pb.TaskStatus_PAUSED
	case database.TaskStatusCompleted:
		return pb.TaskStatus_COMPLETED
	case database.TaskStatusFailed:
		return pb.TaskStatus_FAILED
	case database.TaskStatusCancelled:
		return pb.TaskStatus_CANCELLED
	default:
		return pb.TaskStatus_WAITING
	}
}

func convertPBTaskStatus(pbStatus pb.TaskStatus) database.TaskStatus {
	switch pbStatus {
	case pb.TaskStatus_WAITING:
		return database.TaskStatusWaiting
	case pb.TaskStatus_DOWNLOADING:
		return database.TaskStatusRunning
	case pb.TaskStatus_PAUSED:
		return database.TaskStatusPaused
	case pb.TaskStatus_COMPLETED:
		return database.TaskStatusCompleted
	case pb.TaskStatus_FAILED:
		return database.TaskStatusFailed
	case pb.TaskStatus_CANCELLED:
		return database.TaskStatusCancelled
	default:
		return database.TaskStatusWaiting
	}
}
