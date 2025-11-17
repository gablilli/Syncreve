package client

import (
	"context"
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// Share API methods

// CreateShare creates a new share
func (c *Client) CreateShare(ctx context.Context, req *models.ShareCreateRequest) (string, error) {
	var result string
	err := c.Put(ctx, "/share", req, &result)
	return result, err
}

// UpdateShare updates an existing share
func (c *Client) UpdateShare(ctx context.Context, id string, req *models.ShareCreateRequest) (string, error) {
	var result string
	err := c.Post(ctx, fmt.Sprintf("/share/%s", id), req, &result)
	return result, err
}

// DeleteShare deletes a share
func (c *Client) DeleteShare(ctx context.Context, id string) error {
	return c.Delete(ctx, fmt.Sprintf("/share/%s", id), nil, nil)
}

// GetShareInfo gets share information
func (c *Client) GetShareInfo(ctx context.Context, id string, password *string, countViews, ownerExtended bool) (*models.Share, error) {
	var result models.Share

	path := fmt.Sprintf("/share/info/%s", id)
	params := make(map[string]string)

	if password != nil && *password != "" {
		params["password"] = *password
	}
	if countViews {
		params["count_views"] = "true"
	}
	if ownerExtended {
		params["owner_extended"] = "true"
	}

	err := c.Get(ctx, path, &result, params)
	return &result, err
}

// ListShares lists shares
func (c *Client) ListShares(ctx context.Context, req *models.ListShareRequest) (*models.ListShareResponse, error) {
	var result models.ListShareResponse
	err := c.Get(ctx, "/share", &result, req)
	return &result, err
}
