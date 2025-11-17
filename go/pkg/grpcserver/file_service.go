package grpcserver

import (
	"context"

	"github.com/google/uuid"
	pb "github.com/xkeyC/Syncreve/pkg/grpc/protos"
	"github.com/xkeyC/Syncreve/pkg/manager"
	"github.com/xkeyC/Syncreve/pkg/models"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type fileService struct {
	pb.UnimplementedFileServiceServer
	accountMgr *manager.AccountManager
}

func (f *fileService) ListFiles(ctx context.Context, req *pb.ListFilesRequest) (*pb.ListFilesResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.ListFileRequest{
		URI: req.Path,
	}
	if req.Page != nil {
		page := int(*req.Page)
		apiReq.Page = &page
	}
	if req.PerPage != nil {
		pageSize := int(*req.PerPage)
		apiReq.PageSize = &pageSize
	}
	if req.OrderBy != nil {
		apiReq.OrderBy = req.OrderBy
	}
	if req.OrderDirectionDesc != nil {
		dir := "desc"
		if !*req.OrderDirectionDesc {
			dir = "asc"
		}
		apiReq.OrderDirection = &dir
	}

	result, err := client.ListFiles(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var files []*pb.FileInfo
	for _, file := range result.Files {
		files = append(files, convertFileResponseToFileInfo(&file))
	}

	parentID := ""
	parentPath := ""
	if result.Parent != nil {
		parentID = result.Parent.ID
		parentPath = result.Parent.Path
	}

	totalItems := int64(0)
	if result.Pagination.TotalItems != nil {
		totalItems = int64(*result.Pagination.TotalItems)
	}

	return &pb.ListFilesResponse{
		Files:      files,
		Total:      totalItems,
		ParentId:   parentID,
		ParentPath: parentPath,
	}, nil
}

func (f *fileService) GetFileInfo(ctx context.Context, req *pb.GetFileInfoRequest) (*pb.FileInfoResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.GetFileInfoRequest{
		URI: &req.Uri,
	}

	result, err := client.GetFileInfo(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.FileInfoResponse{
		File: convertFileResponseToFileInfo(result),
	}, nil
}

func (f *fileService) CreateFile(ctx context.Context, req *pb.CreateFileRequest) (*pb.FileInfoResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.CreateFileRequest{
		URI:  req.Path + "/" + req.Name,
		Type: req.Type,
	}

	result, err := client.CreateFile(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.FileInfoResponse{
		File: convertFileResponseToFileInfo(result),
	}, nil
}

func (f *fileService) DeleteFiles(ctx context.Context, req *pb.DeleteFilesRequest) (*pb.DeleteFilesResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.DeleteFileRequest{
		URIs: req.Uris,
	}
	if req.Unlink != nil {
		apiReq.Unlink = req.Unlink
	}

	err = client.DeleteFiles(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.DeleteFilesResponse{
		Count: int32(len(req.Uris)),
	}, nil
}

func (f *fileService) RenameFile(ctx context.Context, req *pb.RenameFileRequest) (*pb.FileInfoResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.RenameFileRequest{
		URI:     req.Uri,
		NewName: req.NewName,
	}

	result, err := client.RenameFile(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.FileInfoResponse{
		File: convertFileResponseToFileInfo(result),
	}, nil
}

func (f *fileService) MoveFiles(ctx context.Context, req *pb.MoveFilesRequest) (*pb.MoveFilesResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.MoveFileRequest{
		URIs: req.SrcUris,
		Dst:  req.DstPath,
	}
	if req.Overwrite != nil {
		copy := *req.Overwrite
		apiReq.Copy = &copy
	}

	err = client.MoveFiles(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &pb.MoveFilesResponse{
		Count: int32(len(req.SrcUris)),
	}, nil
}

func (f *fileService) GetFileURL(ctx context.Context, req *pb.GetFileURLRequest) (*pb.FileURLResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	apiReq := &models.FileURLRequest{
		URIs: []string{req.Uri},
	}
	if req.Download != nil {
		apiReq.Download = req.Download
	}

	result, err := client.GetFileURL(ctx, apiReq)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	if len(result.URLs) == 0 {
		return nil, status.Error(codes.NotFound, "no URL returned")
	}

	resp := &pb.FileURLResponse{
		Url: result.URLs[0].URL,
	}

	return resp, nil
}

func (f *fileService) GetDirectLink(ctx context.Context, req *pb.GetDirectLinkRequest) (*pb.DirectLinkResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "invalid account ID")
	}

	client, err := f.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	result, err := client.GetFileDirectLinks(ctx, req.Uris)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	var links []*pb.DirectLink
	for _, link := range result {
		links = append(links, &pb.DirectLink{
			Id:        link.ID,
			Name:      "",
			Source:    link.URL,
			Enabled:   true,
			CreatedAt: link.CreatedAt.Format("2006-01-02T15:04:05Z"),
			Views:     0,
			Downloads: int64(link.Downloaded),
		})
	}

	return &pb.DirectLinkResponse{
		Links: links,
	}, nil
}

func convertFileResponseToFileInfo(file *models.FileResponse) *pb.FileInfo {
	if file == nil {
		return nil
	}

	fileType := "file"
	if file.Type == models.FileTypeFolder {
		fileType = "dir"
	}

	fileInfo := &pb.FileInfo{
		Id:        file.ID,
		Name:      file.Name,
		Path:      file.Path,
		Size:      file.Size,
		Type:      fileType,
		CreatedAt: file.CreatedAt.Format("2006-01-02T15:04:05Z"),
		UpdatedAt: file.UpdatedAt.Format("2006-01-02T15:04:05Z"),
	}

	return fileInfo
}
