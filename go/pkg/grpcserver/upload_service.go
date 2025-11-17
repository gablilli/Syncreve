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

type uploadService struct {
	pb.UnimplementedUploadServiceServer
	accountMgr *manager.AccountManager
	manager    *manager.UploadManager
}

func (u *uploadService) AddTask(ctx context.Context, req *pb.AddUploadTaskRequest) (*pb.AddUploadTaskResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	overwrite := false
	if req.Overwrite != nil {
		overwrite = *req.Overwrite
	}

	taskID, err := u.manager.AddTask(ctx, accountID, req.LocalPath, req.RemotePath, overwrite)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.AddUploadTaskResponse{
		TaskIds: []string{taskID.String()},
	}, nil
}

func (u *uploadService) AddBatchTasks(ctx context.Context, req *pb.AddBatchUploadTasksRequest) (*pb.AddUploadTaskResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	overwrite := false
	if req.Overwrite != nil {
		overwrite = *req.Overwrite
	}

	var localPaths []string
	for _, file := range req.Files {
		localPaths = append(localPaths, file.LocalPath)
	}

	taskIDs, err := u.manager.AddBatchTasks(ctx, accountID, localPaths, req.RemoteBasePath, overwrite)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var taskIDStrs []string
	for _, id := range taskIDs {
		taskIDStrs = append(taskIDStrs, id.String())
	}

	return &pb.AddUploadTaskResponse{
		TaskIds: taskIDStrs,
	}, nil
}

func (u *uploadService) CancelTask(ctx context.Context, req *pb.CancelUploadTaskRequest) (*pb.CancelUploadTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		errMsg := "invalid task ID"
		return &pb.CancelUploadTaskResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	err = u.manager.CancelTask(taskID)
	if err != nil {
		errMsg := err.Error()
		return &pb.CancelUploadTaskResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.CancelUploadTaskResponse{
		Success: true,
	}, nil
}

func (u *uploadService) GetTaskInfo(ctx context.Context, req *pb.GetUploadTaskInfoRequest) (*pb.UploadTaskInfoResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid task ID")
	}

	task, err := u.manager.GetTask(taskID)
	if err != nil {
		return nil, status.Error(codes.NotFound, err.Error())
	}

	return &pb.UploadTaskInfoResponse{
		Task: convertUploadTask(task),
	}, nil
}

func (u *uploadService) ListTasks(ctx context.Context, req *pb.ListUploadTasksRequest) (*pb.ListUploadTasksResponse, error) {
	var statusFilter *database.TaskStatus

	if req.Status != nil {
		s := convertPBUploadTaskStatus(*req.Status)
		statusFilter = &s
	}

	page := int(req.GetPage())
	perPage := int(req.GetPerPage())

	tasks, total, err := u.manager.ListTasks(statusFilter, page, perPage)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var pbTasks []*pb.UploadTaskInfo
	for _, task := range tasks {
		pbTasks = append(pbTasks, convertUploadTask(task))
	}

	return &pb.ListUploadTasksResponse{
		Tasks: pbTasks,
		Total: total,
	}, nil
}

func (u *uploadService) WatchTaskStatus(req *pb.WatchUploadTaskStatusRequest, stream pb.UploadService_WatchTaskStatusServer) error {
	watcher := u.manager.WatchStatus()
	defer u.manager.UnwatchStatus(watcher)

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

			err := stream.Send(&pb.UploadTaskStatusUpdate{
				Task: convertUploadTask(task),
			})
			if err != nil {
				return err
			}
		case <-stream.Context().Done():
			return nil
		}
	}
}

func (u *uploadService) PauseTask(ctx context.Context, req *pb.PauseUploadTaskRequest) (*pb.PauseUploadTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.PauseUploadTaskResponse{Success: false}, nil
	}

	err = u.manager.PauseTask(taskID)
	return &pb.PauseUploadTaskResponse{Success: err == nil}, nil
}

func (u *uploadService) ResumeTask(ctx context.Context, req *pb.ResumeUploadTaskRequest) (*pb.ResumeUploadTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.ResumeUploadTaskResponse{Success: false}, nil
	}

	err = u.manager.ResumeTask(taskID)
	return &pb.ResumeUploadTaskResponse{Success: err == nil}, nil
}

func (u *uploadService) RetryTask(ctx context.Context, req *pb.RetryUploadTaskRequest) (*pb.RetryUploadTaskResponse, error) {
	taskID, err := uuid.Parse(req.TaskId)
	if err != nil {
		return &pb.RetryUploadTaskResponse{Success: false}, nil
	}

	err = u.manager.RetryTask(taskID)
	return &pb.RetryUploadTaskResponse{
		Success:   err == nil,
		NewTaskId: &req.TaskId,
	}, nil
}

func (u *uploadService) ClearCompleted(ctx context.Context, req *pb.ClearUploadCompletedRequest) (*pb.ClearUploadCompletedResponse, error) {
	count, err := u.manager.ClearCompleted()
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.ClearUploadCompletedResponse{
		ClearedCount: int32(count),
	}, nil
}

func (u *uploadService) GetStats(ctx context.Context, req *pb.GetUploadStatsRequest) (*pb.UploadStatsResponse, error) {
	stats, err := u.manager.GetStats()
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.UploadStatsResponse{
		TotalTasks:        stats.Total,
		WaitingTasks:      stats.Waiting,
		UploadingTasks:    stats.Uploading,
		CompletedTasks:    stats.Completed,
		FailedTasks:       stats.Failed,
		TotalUploadedSize: stats.TotalUploadedSize,
		CurrentSpeed:      stats.CurrentSpeed,
	}, nil
}

func convertUploadTask(task *database.UploadTask) *pb.UploadTaskInfo {
	if task == nil {
		return nil
	}

	pbTask := &pb.UploadTaskInfo{
		Id:           task.ID.String(),
		LocalPath:    task.LocalPath,
		RemotePath:   task.RemotePath,
		FileName:     task.FileName,
		TotalSize:    task.TotalSize,
		UploadedSize: task.UploadedSize,
		Status:       convertUploadTaskStatusToPB(task.Status),
		Error:        task.Error,
		CreatedAt:    task.CreatedAt.Format("2006-01-02T15:04:05Z"),
		UpdatedAt:    task.UpdatedAt.Format("2006-01-02T15:04:05Z"),
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

func convertUploadTaskStatusToPB(s database.TaskStatus) pb.UploadTaskStatus {
	switch s {
	case database.TaskStatusWaiting:
		return pb.UploadTaskStatus_UPLOAD_WAITING
	case database.TaskStatusRunning:
		return pb.UploadTaskStatus_UPLOADING
	case database.TaskStatusPaused:
		return pb.UploadTaskStatus_UPLOAD_PAUSED
	case database.TaskStatusCompleted:
		return pb.UploadTaskStatus_UPLOAD_COMPLETED
	case database.TaskStatusFailed:
		return pb.UploadTaskStatus_UPLOAD_FAILED
	case database.TaskStatusCancelled:
		return pb.UploadTaskStatus_UPLOAD_CANCELLED
	default:
		return pb.UploadTaskStatus_UPLOAD_WAITING
	}
}

func convertPBUploadTaskStatus(pbStatus pb.UploadTaskStatus) database.TaskStatus {
	switch pbStatus {
	case pb.UploadTaskStatus_UPLOAD_WAITING:
		return database.TaskStatusWaiting
	case pb.UploadTaskStatus_UPLOADING:
		return database.TaskStatusRunning
	case pb.UploadTaskStatus_UPLOAD_PAUSED:
		return database.TaskStatusPaused
	case pb.UploadTaskStatus_UPLOAD_COMPLETED:
		return database.TaskStatusCompleted
	case pb.UploadTaskStatus_UPLOAD_FAILED:
		return database.TaskStatusFailed
	case pb.UploadTaskStatus_UPLOAD_CANCELLED:
		return database.TaskStatusCancelled
	default:
		return database.TaskStatusWaiting
	}
}
