package client

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"time"

	"github.com/go-resty/resty/v2"
	"github.com/xkeyC/Syncreve/pkg/models"
)

const (
	DefaultTimeout = 30 * time.Second
	APIPrefix      = "/api/v4"
)

// Config holds the client configuration
type Config struct {
	BaseURL      string        // API base URL
	TokenPath    string        // Path to persistent token storage
	Timeout      time.Duration // HTTP request timeout
	Debug        bool          // Enable debug logging
	EnableLog    bool          // Enable HTTP request/response logging
	AccessToken  string        // Optional: Pre-set access token
	RefreshToken string        // Optional: Pre-set refresh token
}

// Client is the Syncreve API client
type Client struct {
	config       Config
	Resty        *resty.Client
	accessToken  string
	refreshToken string
	tokenExpires time.Time
}

// NewClient creates a new Syncreve API client
func NewClient(cfg Config) (*Client, error) {
	if cfg.BaseURL == "" {
		return nil, fmt.Errorf("base URL is required")
	}

	if cfg.Timeout == 0 {
		cfg.Timeout = DefaultTimeout
	}

	// Create resty client
	restyClient := resty.New()
	restyClient.SetBaseURL(cfg.BaseURL + APIPrefix)
	restyClient.SetTimeout(cfg.Timeout)
	restyClient.SetDebug(cfg.Debug)

	// Set default headers
	restyClient.SetHeaders(map[string]string{
		"Content-Type": "application/json",
		"Accept":       "application/json",
	})

	c := &Client{
		config:       cfg,
		Resty:        restyClient,
		accessToken:  cfg.AccessToken,
		refreshToken: cfg.RefreshToken,
	}

	// Add request/response logging if enabled
	if cfg.EnableLog {
		restyClient.OnBeforeRequest(func(client *resty.Client, req *resty.Request) error {
			log.Printf("[HTTP] --> %s %s", req.Method, req.URL)
			if len(req.QueryParam) > 0 {
				log.Printf("[HTTP]     Query: %v", req.QueryParam)
			}
			return nil
		})

		restyClient.OnAfterResponse(func(client *resty.Client, resp *resty.Response) error {
			log.Printf("[HTTP] <-- %d %s (took %v)", resp.StatusCode(), resp.Request.URL, resp.Time())
			if !resp.IsSuccess() {
				log.Printf("[HTTP]     Error Body: %s", string(resp.Body()))
			}
			return nil
		})
	}

	// Load saved token if path is provided
	if cfg.TokenPath != "" {
		_ = c.LoadToken()
	}

	return c, nil
}

// Close saves tokens and cleans up resources
func (c *Client) Close() error {
	if c.config.TokenPath != "" {
		return c.SaveToken()
	}
	return nil
}

// SetAccessToken sets the access token
func (c *Client) SetAccessToken(token string) {
	c.accessToken = token
}

// SetRefreshToken sets the refresh token
func (c *Client) SetRefreshToken(token string) {
	c.refreshToken = token
}

// GetAccessToken returns the current access token
func (c *Client) GetAccessToken() string {
	return c.accessToken
}

// GetRefreshToken returns the current refresh token
func (c *Client) GetRefreshToken() string {
	return c.refreshToken
}

// SaveToken saves the current token to file
func (c *Client) SaveToken() error {
	if c.config.TokenPath == "" {
		return nil
	}

	token := models.Token{
		AccessToken:    c.accessToken,
		RefreshToken:   c.refreshToken,
		AccessExpires:  c.tokenExpires.Format(time.RFC3339),
		RefreshExpires: "", // We don't track refresh token expiry
	}

	data, err := json.MarshalIndent(token, "", "  ")
	if err != nil {
		return err
	}

	dir := filepath.Dir(c.config.TokenPath)
	if err := os.MkdirAll(dir, 0700); err != nil {
		return err
	}

	return os.WriteFile(c.config.TokenPath, data, 0600)
}

// LoadToken loads the saved token from file
func (c *Client) LoadToken() error {
	if c.config.TokenPath == "" {
		return nil
	}

	data, err := os.ReadFile(c.config.TokenPath)
	if err != nil {
		if os.IsNotExist(err) {
			return nil
		}
		return err
	}

	var token models.Token
	if err := json.Unmarshal(data, &token); err != nil {
		return err
	}

	c.accessToken = token.AccessToken
	c.refreshToken = token.RefreshToken
	if token.AccessExpires != "" {
		c.tokenExpires, _ = time.Parse(time.RFC3339, token.AccessExpires)
	}

	return nil
}

// ClearToken clears the stored token
func (c *Client) ClearToken() error {
	c.accessToken = ""
	c.refreshToken = ""
	c.tokenExpires = time.Time{}

	if c.config.TokenPath != "" {
		_ = os.Remove(c.config.TokenPath)
	}
	return nil
}

// request makes an authenticated request
func (c *Client) request(ctx context.Context, method, path string) *resty.Request {
	req := c.Resty.R().SetContext(ctx)

	// Add authorization header if we have an access token
	if c.accessToken != "" {
		req.SetHeader("Authorization", "Bearer "+c.accessToken)
	}

	return req
}

// Get makes a GET request
// Get makes a GET request with query parameters
func (c *Client) Get(ctx context.Context, path string, result interface{}, params ...interface{}) error {
	req := c.request(ctx, "GET", path)
	if len(params) > 0 {
		queryParams := toStringMap(params[0])
		if c.config.EnableLog {
			log.Printf("[DEBUG] Query params for %s: %+v", path, queryParams)
		}
		req.SetQueryParams(queryParams)
	}

	resp, err := req.SetResult(&apiResponse{Data: result}).Get(path)
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// Post makes a POST request
func (c *Client) Post(ctx context.Context, path string, body interface{}, result interface{}) error {
	req := c.request(ctx, "POST", path)
	if body != nil {
		req.SetBody(body)
	}

	resp, err := req.SetResult(&apiResponse{Data: result}).Post(path)
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// Put makes a PUT request
func (c *Client) Put(ctx context.Context, path string, body interface{}, result interface{}) error {
	req := c.request(ctx, "PUT", path)
	if body != nil {
		req.SetBody(body)
	}

	resp, err := req.SetResult(&apiResponse{Data: result}).Put(path)
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// Patch makes a PATCH request
func (c *Client) Patch(ctx context.Context, path string, body interface{}, result interface{}) error {
	req := c.request(ctx, "PATCH", path)
	if body != nil {
		req.SetBody(body)
	}

	resp, err := req.SetResult(&apiResponse{Data: result}).Patch(path)
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// Delete makes a DELETE request
func (c *Client) Delete(ctx context.Context, path string, body interface{}, result interface{}) error {
	req := c.request(ctx, "DELETE", path)
	if body != nil {
		req.SetBody(body)
	}

	resp, err := req.SetResult(&apiResponse{Data: result}).Delete(path)
	if err != nil {
		return err
	}

	return handleResponse(resp)
}

// apiResponse represents the standard API response wrapper
type apiResponse struct {
	Data          interface{}            `json:"data"`
	Code          int                    `json:"code"`
	Msg           string                 `json:"msg"`
	Error         string                 `json:"error,omitempty"`
	CorrelationID string                 `json:"correlation_id,omitempty"`
	AggregatedErr map[string]interface{} `json:"aggregated_error,omitempty"`
}

// APIError represents an API error
type APIError struct {
	Code          int
	Message       string
	ErrorDetail   string
	CorrelationID string
}

func (e *APIError) Error() string {
	if e.ErrorDetail != "" {
		return fmt.Sprintf("%s (%s)", e.Message, e.ErrorDetail)
	}
	return e.Message
}

// handleResponse handles the API response and checks for errors
func handleResponse(resp *resty.Response) error {
	if !resp.IsSuccess() {
		return fmt.Errorf("HTTP error %d: %s", resp.StatusCode(), resp.String())
	}

	apiResp, ok := resp.Result().(*apiResponse)
	if !ok {
		return nil
	}

	if apiResp.Code != 0 && apiResp.Code != 203 {
		return &APIError{
			Code:          apiResp.Code,
			Message:       apiResp.Msg,
			ErrorDetail:   apiResp.Error,
			CorrelationID: apiResp.CorrelationID,
		}
	}

	return nil
}

// toStringMap converts interface{} to map[string]string for query params
func toStringMap(v interface{}) map[string]string {
	result := make(map[string]string)

	// Use reflection to convert struct fields to map
	// Only include non-nil fields
	switch t := v.(type) {
	case map[string]string:
		return t
	case map[string]interface{}:
		for k, v := range t {
			if v != nil {
				result[k] = fmt.Sprintf("%v", v)
			}
		}
		return result
	}

	// For structs, use encoding/json tags
	val := reflect.ValueOf(v)
	if val.Kind() == reflect.Ptr {
		val = val.Elem()
	}

	if val.Kind() != reflect.Struct {
		return result
	}

	typ := val.Type()
	for i := 0; i < val.NumField(); i++ {
		field := val.Field(i)
		typeField := typ.Field(i)

		// Skip unexported fields
		if !field.CanInterface() {
			continue
		}

		// Get JSON tag name
		tag := typeField.Tag.Get("json")
		if tag == "" || tag == "-" {
			continue
		}

		// Remove omitempty and other options
		tagParts := strings.Split(tag, ",")
		name := tagParts[0]

		// Skip nil pointers or zero values with omitempty
		if field.Kind() == reflect.Ptr && field.IsNil() {
			continue
		}

		// Get value
		var value string
		if field.Kind() == reflect.Ptr {
			value = fmt.Sprintf("%v", field.Elem().Interface())
		} else {
			value = fmt.Sprintf("%v", field.Interface())
		}

		result[name] = value
	}

	return result
}
