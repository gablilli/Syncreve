package client

import (
	"context"
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// User API methods

// GetUserMe gets current user information
func (c *Client) GetUserMe(ctx context.Context) (*models.User, error) {
	var result models.User
	err := c.Get(ctx, "/user/me", &result)
	return &result, err
}

// GetUserInfo gets user information by ID
func (c *Client) GetUserInfo(ctx context.Context, uid string) (*models.User, error) {
	var result models.User
	err := c.Get(ctx, fmt.Sprintf("/user/info/%s", uid), &result)
	return &result, err
}

// GetUserCapacity gets user storage capacity
func (c *Client) GetUserCapacity(ctx context.Context) (*models.Capacity, error) {
	var result models.Capacity
	err := c.Get(ctx, "/user/capacity", &result)
	return &result, err
}

// SearchUser searches users by keyword
func (c *Client) SearchUser(ctx context.Context, keyword string) ([]models.User, error) {
	var result []models.User
	err := c.Get(ctx, fmt.Sprintf("/user/search?keyword=%s", keyword), &result)
	return result, err
}

// GetUserSettings gets user settings
func (c *Client) GetUserSettings(ctx context.Context) (*models.UserSettings, error) {
	var result models.UserSettings
	err := c.Get(ctx, "/user/setting", &result)
	return &result, err
}

// UpdateUserSettings updates user settings
func (c *Client) UpdateUserSettings(ctx context.Context, settings *models.PatchUserSetting) error {
	return c.Patch(ctx, "/user/setting", settings, nil)
}

// UploadAvatar uploads user avatar
func (c *Client) UploadAvatar(ctx context.Context, avatar []byte, contentType string) error {
	req := c.request(ctx, "PUT", "/user/setting/avatar")
	req.SetBody(avatar)
	req.SetHeader("Content-Type", contentType)

	resp, err := req.Put("/user/setting/avatar")
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// Get2FAInitSecret gets 2FA initialization secret
func (c *Client) Get2FAInitSecret(ctx context.Context) (string, error) {
	var result string
	err := c.Get(ctx, "/user/setting/2fa", &result)
	return result, err
}

// PreparePasskeyRegistration prepares passkey registration
func (c *Client) PreparePasskeyRegistration(ctx context.Context) (*models.PasskeyCredentialOption, error) {
	var result models.PasskeyCredentialOption
	err := c.Put(ctx, "/user/authn", nil, &result)
	return &result, err
}

// FinishPasskeyRegistration completes passkey registration
func (c *Client) FinishPasskeyRegistration(ctx context.Context, req *models.FinishPasskeyRegistrationRequest) (*models.Passkey, error) {
	var result models.Passkey
	err := c.Post(ctx, "/user/authn", req, &result)
	return &result, err
}

// DeletePasskey deletes a passkey
func (c *Client) DeletePasskey(ctx context.Context, id string) error {
	return c.Delete(ctx, fmt.Sprintf("/user/authn?id=%s", id), nil, nil)
}

// GetUserShares gets shares for a specific user
func (c *Client) GetUserShares(ctx context.Context, uid string, req *models.ListShareRequest) (*models.ListShareResponse, error) {
	var result models.ListShareResponse
	err := c.Get(ctx, fmt.Sprintf("/user/shares/%s", uid), &result, req)
	return &result, err
}
