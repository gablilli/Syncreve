package client

import (
	"context"
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// Setting API methods

// ListDavAccounts lists WebDAV accounts
func (c *Client) ListDavAccounts(ctx context.Context, req *models.ListDavAccountsRequest) (*models.ListDavAccountsResponse, error) {
	var result models.ListDavAccountsResponse
	err := c.Get(ctx, "/devices/dav", &result, req)
	return &result, err
}

// CreateDavAccount creates a WebDAV account
func (c *Client) CreateDavAccount(ctx context.Context, req *models.CreateDavAccountRequest) (*models.DavAccount, error) {
	var result models.DavAccount
	err := c.Put(ctx, "/devices/dav", req, &result)
	return &result, err
}

// UpdateDavAccount updates a WebDAV account
func (c *Client) UpdateDavAccount(ctx context.Context, id string, req *models.CreateDavAccountRequest) (*models.DavAccount, error) {
	var result models.DavAccount
	err := c.Patch(ctx, fmt.Sprintf("/devices/dav/%s", id), req, &result)
	return &result, err
}

// DeleteDavAccount deletes a WebDAV account
func (c *Client) DeleteDavAccount(ctx context.Context, id string) error {
	return c.Delete(ctx, fmt.Sprintf("/devices/dav/%s", id), nil, nil)
}
