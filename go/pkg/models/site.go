package models

// CaptchaType represents captcha types
type CaptchaType string

const (
	CaptchaTypeNormal    CaptchaType = "normal"
	CaptchaTypeRecaptcha CaptchaType = "recaptcha"
	CaptchaTypeTurnstile CaptchaType = "turnstile"
	CaptchaTypeCap       CaptchaType = "cap"
)

// SiteConfig represents site configuration
type SiteConfig struct {
	InstanceID            *string         `json:"instance_id,omitempty"`
	Title                 *string         `json:"title,omitempty"`
	LoginCaptcha          *bool           `json:"login_captcha,omitempty"`
	RegCaptcha            *bool           `json:"reg_captcha,omitempty"`
	ForgetCaptcha         *bool           `json:"forget_captcha,omitempty"`
	Themes                *string         `json:"themes,omitempty"`
	DefaultTheme          *string         `json:"default_theme,omitempty"`
	Authn                 *bool           `json:"authn,omitempty"`
	User                  *User           `json:"user,omitempty"`
	CaptchaReCaptchaKey   *string         `json:"captcha_ReCaptchaKey,omitempty"`
	CaptchaType           *CaptchaType    `json:"captcha_type,omitempty"`
	TurnstileSiteID       *string         `json:"turnstile_site_id,omitempty"`
	CaptchaCapInstanceURL *string         `json:"captcha_cap_instance_url,omitempty"`
	CaptchaCapSiteKey     *string         `json:"captcha_cap_site_key,omitempty"`
	CaptchaCapSecretKey   *string         `json:"captcha_cap_secret_key,omitempty"`
	CaptchaCapAssetServer *string         `json:"captcha_cap_asset_server,omitempty"`
	RegisterEnabled       *bool           `json:"register_enabled,omitempty"`
	Logo                  *string         `json:"logo,omitempty"`
	LogoLight             *string         `json:"logo_light,omitempty"`
	TosURL                *string         `json:"tos_url,omitempty"`
	PrivacyPolicyURL      *string         `json:"privacy_policy_url,omitempty"`
	Icons                 *string         `json:"icons,omitempty"`
	EmojiPreset           *string         `json:"emoji_preset,omitempty"`
	MapProvider           *string         `json:"map_provider,omitempty"`
	MapboxAK              *string         `json:"mapbox_ak,omitempty"`
	GoogleMapTileType     *string         `json:"google_map_tile_type,omitempty"`
	FileViewers           interface{}     `json:"file_viewers,omitempty"`
	MaxBatchSize          *int            `json:"max_batch_size,omitempty"`
	AppPromotion          *bool           `json:"app_promotion,omitempty"`
	ThumbnailWidth        *int            `json:"thumbnail_width,omitempty"`
	ThumbnailHeight       *int            `json:"thumbnail_height,omitempty"`
	CustomProps           interface{}     `json:"custom_props,omitempty"`
	CustomNavItems        []CustomNavItem `json:"custom_nav_items,omitempty"`
	CustomHTML            *CustomHTML     `json:"custom_html,omitempty"`
	ThumbExts             []string        `json:"thumb_exts,omitempty"`
	ShowEncryptionStatus  *bool           `json:"show_encryption_status,omitempty"`
}

// CustomNavItem represents a custom navigation item
type CustomNavItem struct {
	Name string `json:"name"`
	URL  string `json:"url"`
	Icon string `json:"icon"`
}

// CustomHTML represents custom HTML sections
type CustomHTML struct {
	HeadlessFooter *string `json:"headless_footer,omitempty"`
	HeadlessBottom *string `json:"headless_bottom,omitempty"`
	SidebarBottom  *string `json:"sidebar_bottom,omitempty"`
}
