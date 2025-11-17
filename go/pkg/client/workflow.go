package client

import (
	"context"
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// Workflow API methods

// CreateArchive creates an archive task
func (c *Client) CreateArchive(ctx context.Context, req *models.ArchiveWorkflowRequest) (*models.TaskResponse, error) {
	var result models.TaskResponse
	err := c.Post(ctx, "/workflow/archive", req, &result)
	return &result, err
}

// ExtractArchive creates an archive extraction task
func (c *Client) ExtractArchive(ctx context.Context, req *models.ArchiveWorkflowRequest) (*models.TaskResponse, error) {
	var result models.TaskResponse
	err := c.Post(ctx, "/workflow/extract", req, &result)
	return &result, err
}

// ListTasks lists workflow tasks
func (c *Client) ListTasks(ctx context.Context, req *models.ListTaskRequest) (*models.TaskListResponse, error) {
	var result models.TaskListResponse
	err := c.Get(ctx, "/workflow", &result, req)
	return &result, err
}

// GetTaskProgress gets task progress
func (c *Client) GetTaskProgress(ctx context.Context, id string) (*models.TaskProgresses, error) {
	var result models.TaskProgresses
	err := c.Get(ctx, fmt.Sprintf("/workflow/progress/%s", id), &result)
	return &result, err
}

// CreateRemoteDownload creates a remote download task
func (c *Client) CreateRemoteDownload(ctx context.Context, req *models.DownloadWorkflowRequest) ([]models.TaskResponse, error) {
	var result []models.TaskResponse
	err := c.Post(ctx, "/workflow/download", req, &result)
	return result, err
}

// SetDownloadFiles sets which files to download in a remote download task
func (c *Client) SetDownloadFiles(ctx context.Context, id string, req *models.SetDownloadFilesRequest) error {
	return c.Patch(ctx, fmt.Sprintf("/workflow/download/%s", id), req, nil)
}

// CancelDownloadTask cancels a remote download task
func (c *Client) CancelDownloadTask(ctx context.Context, id string) error {
	return c.Delete(ctx, fmt.Sprintf("/workflow/download/%s", id), nil, nil)
}

// ImportFiles creates an import task
func (c *Client) ImportFiles(ctx context.Context, req *models.ImportWorkflowRequest) (*models.TaskResponse, error) {
	var result models.TaskResponse
	err := c.Post(ctx, "/workflow/import", req, &result)
	return &result, err
}
