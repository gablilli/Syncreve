package models

import "time"

// User represents a user in the system
type User struct {
	ID                  string      `json:"id"`
	Email               *string     `json:"email,omitempty"`
	Nickname            string      `json:"nickname"`
	Status              interface{} `json:"status,omitempty"`
	Avatar              *string     `json:"avatar,omitempty"`
	CreatedAt           time.Time   `json:"created_at"`
	PreferredTheme      *string     `json:"preferred_theme,omitempty"`
	Anonymous           *bool       `json:"anonymous,omitempty"`
	Group               *Group      `json:"group,omitempty"`
	Pined               []PinedFile `json:"pined,omitempty"`
	Language            *string     `json:"language,omitempty"`
	DisableViewSync     *bool       `json:"disable_view_sync,omitempty"`
	ShareLinksInProfile *string     `json:"share_links_in_profile,omitempty"`
}

// Group represents a user group
type Group struct {
	ID                  string  `json:"id"`
	Name                string  `json:"name"`
	Permission          *string `json:"permission,omitempty"`
	DirectLinkBatchSize *int    `json:"direct_link_batch_size,omitempty"`
	TrashRetention      *int    `json:"trash_retention,omitempty"`
}

// PinedFile represents a pinned file
type PinedFile struct {
	URI  string  `json:"uri"`
	Name *string `json:"name,omitempty"`
}

// PrepareLoginResponse represents the prepare login response
type PrepareLoginResponse struct {
	WebAuthnEnabled bool `json:"webauthn_enabled"`
	SSOEnabled      bool `json:"sso_enabled"`
	PasswordEnabled bool `json:"password_enabled"`
	QQEnabled       bool `json:"qq_enabled"`
}

// PasswordLoginRequest represents a password login request
type PasswordLoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	// Captcha fields can be added as needed
}

// Token represents authentication tokens
type Token struct {
	AccessToken    string `json:"access_token"`
	RefreshToken   string `json:"refresh_token"`
	AccessExpires  string `json:"access_expires"`
	RefreshExpires string `json:"refresh_expires"`
}

// LoginResponse represents a login response
type LoginResponse struct {
	User  User  `json:"user"`
	Token Token `json:"token"`
}

// TwoFALoginRequest represents a 2FA login request
type TwoFALoginRequest struct {
	OTP       string `json:"otp"`
	SessionID string `json:"session_id"`
}

// RefreshTokenRequest represents a refresh token request
type RefreshTokenRequest struct {
	RefreshToken string `json:"refresh_token"`
}

// Capacity represents storage capacity
type Capacity struct {
	Total int64 `json:"total"`
	Used  int64 `json:"used"`
}

// UserSettings represents user settings
type UserSettings struct {
	VersionRetentionEnabled bool      `json:"version_retention_enabled"`
	VersionRetentionExt     []string  `json:"version_retention_ext,omitempty"`
	VersionRetentionMax     *int      `json:"version_retention_max,omitempty"`
	Passwordless            bool      `json:"passwordless"`
	TwoFAEnabled            bool      `json:"two_fa_enabled"`
	Passkeys                []Passkey `json:"passkeys,omitempty"`
	DisableViewSync         bool      `json:"disable_view_sync"`
	ShareLinksInProfile     string    `json:"share_links_in_profile"`
}

// PatchUserSetting represents user setting update request
type PatchUserSetting struct {
	Nick                    *string  `json:"nick,omitempty"`
	Language                *string  `json:"language,omitempty"`
	PreferredTheme          *string  `json:"preferred_theme,omitempty"`
	VersionRetentionEnabled *bool    `json:"version_retention_enabled,omitempty"`
	VersionRetentionExt     []string `json:"version_retention_ext,omitempty"`
	VersionRetentionMax     *int     `json:"version_retention_max,omitempty"`
	CurrentPassword         *string  `json:"current_password,omitempty"`
	NewPassword             *string  `json:"new_password,omitempty"`
	TwoFAEnabled            *bool    `json:"two_fa_enabled,omitempty"`
	TwoFACode               *string  `json:"two_fa_code,omitempty"`
	DisableViewSync         *bool    `json:"disable_view_sync,omitempty"`
	ShareLinksInProfile     *string  `json:"share_links_in_profile,omitempty"`
}

// Passkey represents a passkey credential
type Passkey struct {
	ID        string    `json:"id"`
	Name      string    `json:"name"`
	CreatedAt time.Time `json:"created_at"`
	UsedAt    time.Time `json:"used_at"`
}

// PasskeyCredentialOption represents passkey credential creation options
type PasskeyCredentialOption struct {
	PublicKey interface{} `json:"publicKey"`
}

// PreparePasskeyLoginResponse represents passkey login preparation response
type PreparePasskeyLoginResponse struct {
	Options   interface{} `json:"options"`
	SessionID string      `json:"session_id"`
}

// FinishPasskeyRegistrationRequest represents passkey registration completion
type FinishPasskeyRegistrationRequest struct {
	Response string `json:"response"`
	Name     string `json:"name"`
	UA       string `json:"ua"`
}

// FinishPasskeyLoginRequest represents passkey login completion
type FinishPasskeyLoginRequest struct {
	Response  string `json:"response"`
	SessionID string `json:"session_id"`
}

// SignUpRequest represents a sign up request
type SignUpRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	Language string `json:"language"`
}

// SendResetEmailRequest represents a password reset email request
type SendResetEmailRequest struct {
	Email string `json:"email"`
}

// ResetPasswordRequest represents a password reset request
type ResetPasswordRequest struct {
	Password string `json:"password"`
	Secret   string `json:"secret"`
}

// CaptchaResponse represents a captcha response
type CaptchaResponse struct {
	Ticket string `json:"ticket"`
	Image  string `json:"image"`
}
