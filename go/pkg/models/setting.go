package models

import "time"

// ListDavAccountsRequest represents a DAV accounts list request
type ListDavAccountsRequest struct {
	PageSize      int     `json:"page_size"`
	NextPageToken *string `json:"next_page_token,omitempty"`
}

// DavAccount represents a WebDAV account
type DavAccount struct {
	ID        string    `json:"id"`
	CreatedAt time.Time `json:"created_at"`
	Name      string    `json:"name"`
	URI       string    `json:"uri"`
	Password  string    `json:"password"`
	Options   *string   `json:"options,omitempty"`
}

// ListDavAccountsResponse represents a DAV accounts list response
type ListDavAccountsResponse struct {
	Accounts   []DavAccount       `json:"accounts"`
	Pagination *PaginationResults `json:"pagination,omitempty"`
}

// CreateDavAccountRequest represents a DAV account creation request
type CreateDavAccountRequest struct {
	Name            string `json:"name"`
	URI             string `json:"uri"`
	Readonly        *bool  `json:"readonly,omitempty"`
	Proxy           *bool  `json:"proxy,omitempty"`
	DisableSysFiles *bool  `json:"disable_sys_files,omitempty"`
}
