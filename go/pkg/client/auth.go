package client

import (
	"context"
	"fmt"
	"time"

	"github.com/xkeyC/Syncreve/pkg/models"
)

// Auth API methods

// GetSiteConfig gets site configuration for a specific section
func (c *Client) GetSiteConfig(ctx context.Context, section string) (*models.SiteConfig, error) {
	var result models.SiteConfig
	err := c.Get(ctx, "/site/config/"+section, &result)
	return &result, err
}

// SendPrepareLogin prepares login and returns available login methods
func (c *Client) SendPrepareLogin(ctx context.Context, email string) (*models.PrepareLoginResponse, error) {
	var result models.PrepareLoginResponse
	params := map[string]string{"email": email}
	err := c.Get(ctx, "/session/prepare", &result, params)
	return &result, err
}

// GetCaptcha gets a captcha challenge
func (c *Client) GetCaptcha(ctx context.Context) (*models.CaptchaResponse, error) {
	var result models.CaptchaResponse
	err := c.Get(ctx, "/site/captcha", &result)
	return &result, err
}

// Login performs password-based login
func (c *Client) Login(ctx context.Context, req *models.PasswordLoginRequest) (*models.LoginResponse, error) {
	var result models.LoginResponse
	err := c.Post(ctx, "/session/token", req, &result)
	if err == nil {
		c.accessToken = result.Token.AccessToken
		c.refreshToken = result.Token.RefreshToken
		// Parse and save token expiry
		if result.Token.AccessExpires != "" {
			c.tokenExpires, _ = time.Parse(time.RFC3339, result.Token.AccessExpires)
		}
		// Auto-save token
		_ = c.SaveToken()
	}
	return &result, err
}

// Login2FA performs 2FA login
func (c *Client) Login2FA(ctx context.Context, req *models.TwoFALoginRequest) (*models.LoginResponse, error) {
	var result models.LoginResponse
	err := c.Post(ctx, "/session/token/2fa", req, &result)
	if err == nil {
		c.accessToken = result.Token.AccessToken
		c.refreshToken = result.Token.RefreshToken
	}
	return &result, err
}

// RefreshToken refreshes the access token
func (c *Client) RefreshToken(ctx context.Context, req *models.RefreshTokenRequest) (*models.Token, error) {
	var result models.Token
	err := c.Post(ctx, "/session/token/refresh", req, &result)
	if err == nil {
		c.accessToken = result.AccessToken
		c.refreshToken = result.RefreshToken
	}
	return &result, err
}

// Signout signs out the current user
func (c *Client) Signout(ctx context.Context, req *models.RefreshTokenRequest) error {
	var result string
	return c.Delete(ctx, "/session/token", req, &result)
}

// PreparePasskeyLogin prepares passkey-based login
func (c *Client) PreparePasskeyLogin(ctx context.Context) (*models.PreparePasskeyLoginResponse, error) {
	var result models.PreparePasskeyLoginResponse
	err := c.Put(ctx, "/session/authn", nil, &result)
	return &result, err
}

// FinishPasskeyLogin completes passkey-based login
func (c *Client) FinishPasskeyLogin(ctx context.Context, req *models.FinishPasskeyLoginRequest) (*models.LoginResponse, error) {
	var result models.LoginResponse
	err := c.Post(ctx, "/session/authn", req, &result)
	if err == nil {
		c.accessToken = result.Token.AccessToken
		c.refreshToken = result.Token.RefreshToken
	}
	return &result, err
}

// SignUp registers a new user
func (c *Client) SignUp(ctx context.Context, req *models.SignUpRequest) (*models.User, error) {
	var result models.User
	err := c.Post(ctx, "/user", req, &result)
	return &result, err
}

// ActivateEmail activates user email
func (c *Client) ActivateEmail(ctx context.Context, id, sign string) (*models.User, error) {
	var result models.User
	path := fmt.Sprintf("/user/activate/%s?sign=%s", id, sign)
	err := c.Get(ctx, path, &result)
	return &result, err
}

// SendResetEmail sends password reset email
func (c *Client) SendResetEmail(ctx context.Context, req *models.SendResetEmailRequest) (*models.User, error) {
	var result models.User
	err := c.Post(ctx, "/user/reset", req, &result)
	return &result, err
}

// ResetPassword resets user password
func (c *Client) ResetPassword(ctx context.Context, uid string, req *models.ResetPasswordRequest) (*models.User, error) {
	var result models.User
	err := c.Patch(ctx, fmt.Sprintf("/user/reset/%s", uid), req, &result)
	return &result, err
}
