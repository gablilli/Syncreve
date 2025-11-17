package client

import (
	"context"
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// File API methods

// ListFiles lists files in a directory
func (c *Client) ListFiles(ctx context.Context, req *models.ListFileRequest) (*models.ListResponse, error) {
	var result models.ListResponse
	err := c.Get(ctx, "/file", &result, req)
	return &result, err
}

// GetFileThumb gets file thumbnail
func (c *Client) GetFileThumb(ctx context.Context, path string, contextHint *string) (*models.FileThumbResponse, error) {
	var result models.FileThumbResponse
	params := map[string]string{"uri": path}

	req := c.request(ctx, "GET", "/file/thumb")
	req.SetQueryParams(params)
	if contextHint != nil {
		req.SetHeader("X-Cr-Context-Hint", *contextHint)
	}

	resp, err := req.SetResult(&apiResponse{Data: &result}).Get("/file/thumb")
	if err != nil {
		return nil, err
	}

	if err := handleResponse(resp); err != nil {
		return nil, err
	}

	return &result, nil
}

// GetFileInfo gets file information
func (c *Client) GetFileInfo(ctx context.Context, req *models.GetFileInfoRequest) (*models.FileResponse, error) {
	var result models.FileResponse
	err := c.Get(ctx, "/file/info", &result, req)
	return &result, err
}

// CreateFile creates a new file or folder
func (c *Client) CreateFile(ctx context.Context, req *models.CreateFileRequest) (*models.FileResponse, error) {
	var result models.FileResponse
	err := c.Post(ctx, "/file/create", req, &result)
	return &result, err
}

// DeleteFiles deletes files
func (c *Client) DeleteFiles(ctx context.Context, req *models.DeleteFileRequest) error {
	return c.Delete(ctx, "/file", req, nil)
}

// UnlockFiles unlocks files
func (c *Client) UnlockFiles(ctx context.Context, req *models.UnlockFileRequest) error {
	return c.Delete(ctx, "/file/lock", req, nil)
}

// RenameFile renames a file
func (c *Client) RenameFile(ctx context.Context, req *models.RenameFileRequest) (*models.FileResponse, error) {
	var result models.FileResponse
	err := c.Post(ctx, "/file/rename", req, &result)
	return &result, err
}

// PinFile pins a file
func (c *Client) PinFile(ctx context.Context, req *models.PinFileRequest) error {
	return c.Put(ctx, "/file/pin", req, nil)
}

// UnpinFile unpins a file
func (c *Client) UnpinFile(ctx context.Context, req *models.PinFileRequest) error {
	return c.Delete(ctx, "/file/pin", req, nil)
}

// MoveFiles moves files
func (c *Client) MoveFiles(ctx context.Context, req *models.MoveFileRequest) error {
	return c.Post(ctx, "/file/move", req, nil)
}

// RestoreFiles restores files from trash
func (c *Client) RestoreFiles(ctx context.Context, req *models.DeleteFileRequest) error {
	return c.Post(ctx, "/file/restore", req, nil)
}

// PatchMetadata patches file metadata
func (c *Client) PatchMetadata(ctx context.Context, req *models.PatchMetadataRequest) error {
	return c.Patch(ctx, "/file/metadata", req, nil)
}

// GetFileURL gets file download/access URLs
func (c *Client) GetFileURL(ctx context.Context, req *models.FileURLRequest) (*models.FileURLResponse, error) {
	var result models.FileURLResponse
	err := c.Post(ctx, "/file/url", req, &result)
	return &result, err
}

// SetCurrentVersion sets current file version
func (c *Client) SetCurrentVersion(ctx context.Context, req *models.VersionControlRequest) error {
	return c.Post(ctx, "/file/version/current", req, nil)
}

// DeleteVersion deletes a file version
func (c *Client) DeleteVersion(ctx context.Context, req *models.VersionControlRequest) error {
	return c.Delete(ctx, "/file/version", req, nil)
}

// UpdateFile updates file content
func (c *Client) UpdateFile(ctx context.Context, params *models.FileUpdateRequest, data []byte) (*models.FileResponse, error) {
	var result models.FileResponse

	req := c.request(ctx, "PUT", "/file/content")
	req.SetQueryParams(map[string]string{
		"uri": params.URI,
	})
	if params.Previous != nil {
		req.SetQueryParam("previous", *params.Previous)
	}
	req.SetBody(data)
	req.SetHeader("Content-Type", "application/octet-stream")

	resp, err := req.SetResult(&apiResponse{Data: &result}).Put("/file/content")
	if err != nil {
		return nil, err
	}

	if err := handleResponse(resp); err != nil {
		return nil, err
	}

	return &result, nil
}

// CreateViewerSession creates a viewer session
func (c *Client) CreateViewerSession(ctx context.Context, req *models.CreateViewerSessionRequest) (*models.ViewerSessionResponse, error) {
	var result models.ViewerSessionResponse
	err := c.Put(ctx, "/file/viewerSession", req, &result)
	return &result, err
}

// CreateUploadSession creates an upload session
func (c *Client) CreateUploadSession(ctx context.Context, req *models.UploadSessionRequest) (*models.UploadCredential, error) {
	var result models.UploadCredential
	err := c.Put(ctx, "/file/upload", req, &result)
	return &result, err
}

// UploadChunk uploads a file chunk
func (c *Client) UploadChunk(ctx context.Context, sessionID string, chunk []byte, index int) (*models.UploadCredential, error) {
	var result models.UploadCredential

	path := fmt.Sprintf("/file/upload/%s/%d", sessionID, index)
	req := c.request(ctx, "POST", path)
	req.SetBody(chunk)
	req.SetHeader("Content-Type", "application/octet-stream")

	resp, err := req.SetResult(&apiResponse{Data: &result}).Post(path)
	if err != nil {
		return nil, err
	}

	if err := handleResponse(resp); err != nil {
		return nil, err
	}

	return &result, nil
}

// DeleteUploadSession deletes an upload session
func (c *Client) DeleteUploadSession(ctx context.Context, req *models.DeleteUploadSessionRequest) error {
	return c.Delete(ctx, "/file/upload", req, nil)
}

// PatchViewSync updates view sync settings
func (c *Client) PatchViewSync(ctx context.Context, req *models.PatchViewSyncRequest) error {
	return c.Patch(ctx, "/file/view", req, nil)
}

// GetFileDirectLinks gets direct links for files
func (c *Client) GetFileDirectLinks(ctx context.Context, uris []string) ([]models.DirectLink, error) {
	var result []models.DirectLink
	req := map[string][]string{"uris": uris}
	err := c.Put(ctx, "/file/source", req, &result)
	return result, err
}

// DeleteDirectLink deletes a direct link
func (c *Client) DeleteDirectLink(ctx context.Context, id string) error {
	return c.Delete(ctx, fmt.Sprintf("/file/source/%s", id), nil, nil)
}

// ListArchiveFiles lists files in an archive
func (c *Client) ListArchiveFiles(ctx context.Context, req *models.ArchiveListFilesRequest) (*models.ArchiveListFilesResponse, error) {
	var result models.ArchiveListFilesResponse
	err := c.Get(ctx, "/file/archive/list", &result, req)
	return &result, err
}
