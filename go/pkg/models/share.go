package models

// ListShareRequest represents a share list request
type ListShareRequest struct {
	PageSize       int     `json:"page_size"`
	OrderBy        *string `json:"order_by,omitempty"`
	OrderDirection *string `json:"order_direction,omitempty"`
	NextPageToken  *string `json:"next_page_token,omitempty"`
}

// ListShareResponse represents a share list response
type ListShareResponse struct {
	Shares     []Share           `json:"shares"`
	Pagination PaginationResults `json:"pagination"`
}
