package models

import "time"

// FileType constants
const (
	FileTypeFile   = 0
	FileTypeFolder = 1
)

// ListFileRequest represents a file list request
type ListFileRequest struct {
	URI            string  `json:"uri"`
	Page           *int    `json:"page,omitempty"`
	PageSize       *int    `json:"page_size,omitempty"`
	OrderBy        *string `json:"order_by,omitempty"`
	OrderDirection *string `json:"order_direction,omitempty"`
	NextPageToken  *string `json:"next_page_token,omitempty"`
}

// FileResponse represents a file in the system
type FileResponse struct {
	Type          int               `json:"type"`
	ID            string            `json:"id"`
	Name          string            `json:"name"`
	CreatedAt     time.Time         `json:"created_at"`
	UpdatedAt     time.Time         `json:"updated_at"`
	Size          int64             `json:"size"`
	Metadata      map[string]string `json:"metadata,omitempty"`
	Path          string            `json:"path"`
	Shared        *bool             `json:"shared,omitempty"`
	Capability    *string           `json:"capability,omitempty"`
	Owned         *bool             `json:"owned,omitempty"`
	FolderSummary *FolderSummary    `json:"folder_summary,omitempty"`
	ExtendedInfo  *ExtendedInfo     `json:"extended_info,omitempty"`
	PrimaryEntity *string           `json:"primary_entity,omitempty"`
}

// FolderSummary represents folder statistics
type FolderSummary struct {
	Size         int64     `json:"size"`
	Files        int       `json:"files"`
	Folders      int       `json:"folders"`
	Completed    bool      `json:"completed"`
	CalculatedAt time.Time `json:"calculated_at"`
}

// ExtendedInfo represents extended file information
type ExtendedInfo struct {
	StoragePolicy *StoragePolicy `json:"storage_policy,omitempty"`
	StorageUsed   int64          `json:"storage_used"`
	Shares        []Share        `json:"shares,omitempty"`
	Entities      []Entity       `json:"entities,omitempty"`
	View          *ExplorerView  `json:"view,omitempty"`
	DirectLinks   []DirectLink   `json:"direct_links,omitempty"`
}

// DirectLink represents a direct download link
type DirectLink struct {
	ID         string    `json:"id"`
	CreatedAt  time.Time `json:"created_at"`
	URL        string    `json:"url"`
	Downloaded int       `json:"downloaded"`
}

// Entity represents a storage entity
type Entity struct {
	ID            string         `json:"id"`
	Type          int            `json:"type"`
	CreatedAt     time.Time      `json:"created_at"`
	StoragePolicy *StoragePolicy `json:"storage_policy,omitempty"`
	Size          int64          `json:"size"`
	CreatedBy     *User          `json:"created_by,omitempty"`
	EncryptedWith *string        `json:"encrypted_with,omitempty"`
}

// Share represents a file share
type Share struct {
	ID                string  `json:"id"`
	Name              *string `json:"name,omitempty"`
	Expires           *string `json:"expires,omitempty"`
	IsPrivate         *bool   `json:"is_private,omitempty"`
	ShareView         *bool   `json:"share_view,omitempty"`
	RemainDownloads   *int    `json:"remain_downloads,omitempty"`
	CreatedAt         *string `json:"created_at,omitempty"`
	URL               string  `json:"url"`
	Visited           int     `json:"visited"`
	Downloaded        int     `json:"downloaded"`
	Expired           *bool   `json:"expired,omitempty"`
	Unlocked          bool    `json:"unlocked"`
	PasswordProtected bool    `json:"password_protected"`
	SourceType        *int    `json:"source_type,omitempty"`
	Owner             User    `json:"owner"`
	SourceURI         *string `json:"source_uri,omitempty"`
	Password          *string `json:"password,omitempty"`
	ShowReadme        *bool   `json:"show_readme,omitempty"`
}

// StoragePolicy represents a storage policy
type StoragePolicy struct {
	ID                  string   `json:"id"`
	Name                string   `json:"name"`
	AllowedSuffix       []string `json:"allowed_suffix,omitempty"`
	DeniedSuffix        []string `json:"denied_suffix,omitempty"`
	AllowedNameRegexp   *string  `json:"allowed_name_regexp,omitempty"`
	DeniedNameRegexp    *string  `json:"denied_name_regexp,omitempty"`
	MaxSize             int64    `json:"max_size"`
	Type                string   `json:"type"`
	Relay               *bool    `json:"relay,omitempty"`
	ChunkConcurrency    *int     `json:"chunk_concurrency,omitempty"`
	Encryption          *bool    `json:"encryption,omitempty"`
	StreamingEncryption *bool    `json:"streaming_encryption,omitempty"`
}

// PaginationResults represents pagination information
type PaginationResults struct {
	Page       int     `json:"page"`
	PageSize   int     `json:"page_size"`
	TotalItems *int    `json:"total_items,omitempty"`
	NextToken  *string `json:"next_token,omitempty"`
	IsCursor   *bool   `json:"is_cursor,omitempty"`
}

// ExplorerView represents file explorer view settings
type ExplorerView struct {
	PageSize       int         `json:"page_size"`
	Order          *string     `json:"order,omitempty"`
	OrderDirection *string     `json:"order_direction,omitempty"`
	View           *string     `json:"view,omitempty"`
	Thumbnail      *bool       `json:"thumbnail,omitempty"`
	Columns        interface{} `json:"columns,omitempty"`
	GalleryWidth   *int        `json:"gallery_width,omitempty"`
}

// ListResponse represents a file list response
type ListResponse struct {
	Files                 []FileResponse    `json:"files"`
	Pagination            PaginationResults `json:"pagination"`
	Props                 NavigatorProps    `json:"props"`
	ContextHint           *string           `json:"context_hint,omitempty"`
	RecursionLimitReached *bool             `json:"recursion_limit_reached,omitempty"`
	MixedType             *bool             `json:"mixed_type,omitempty"`
	SingleFileView        *bool             `json:"single_file_view,omitempty"`
	Parent                *FileResponse     `json:"parent,omitempty"`
	StoragePolicy         *StoragePolicy    `json:"storage_policy,omitempty"`
	View                  *ExplorerView     `json:"view,omitempty"`
}

// NavigatorProps represents navigator properties
type NavigatorProps struct {
	Capability            *string  `json:"capability,omitempty"`
	MaxPageSize           int      `json:"max_page_size"`
	OrderByOptions        []string `json:"order_by_options"`
	OrderDirectionOptions []string `json:"order_direction_options"`
}

// FileThumbResponse represents a file thumbnail response
type FileThumbResponse struct {
	URL     string  `json:"url"`
	Expires *string `json:"expires,omitempty"`
}

// DeleteFileRequest represents a file deletion request
type DeleteFileRequest struct {
	URIs           []string `json:"uris"`
	Unlink         *bool    `json:"unlink,omitempty"`
	SkipSoftDelete *bool    `json:"skip_soft_delete,omitempty"`
}

// UnlockFileRequest represents a file unlock request
type UnlockFileRequest struct {
	Tokens []string `json:"tokens"`
}

// RenameFileRequest represents a file rename request
type RenameFileRequest struct {
	URI     string `json:"uri"`
	NewName string `json:"new_name"`
}

// PinFileRequest represents a file pin request
type PinFileRequest struct {
	URI  string  `json:"uri"`
	Name *string `json:"name,omitempty"`
}

// MoveFileRequest represents a file move request
type MoveFileRequest struct {
	URIs []string `json:"uris"`
	Dst  string   `json:"dst"`
	Copy *bool    `json:"copy,omitempty"`
}

// MetadataPatch represents a metadata patch operation
type MetadataPatch struct {
	Key    string  `json:"key"`
	Value  *string `json:"value,omitempty"`
	Remove *bool   `json:"remove,omitempty"`
}

// PatchMetadataRequest represents a metadata patch request
type PatchMetadataRequest struct {
	URIs    []string        `json:"uris"`
	Patches []MetadataPatch `json:"patches"`
}

// ShareCreateRequest represents a share creation request
type ShareCreateRequest struct {
	URI        string  `json:"uri"`
	Downloads  *int    `json:"downloads,omitempty"`
	IsPrivate  *bool   `json:"is_private,omitempty"`
	Password   *string `json:"password,omitempty"`
	Expire     *int    `json:"expire,omitempty"`
	ShareView  *bool   `json:"share_view,omitempty"`
	ShowReadme *bool   `json:"show_readme,omitempty"`
}

// CreateFileRequest represents a file creation request
type CreateFileRequest struct {
	URI           string            `json:"uri"`
	Type          string            `json:"type"` // "file" or "folder"
	ErrOnConflict *bool             `json:"err_on_conflict,omitempty"`
	Metadata      map[string]string `json:"metadata,omitempty"`
}

// FileURLRequest represents a file URL request
type FileURLRequest struct {
	URIs              []string `json:"uris"`
	Download          *bool    `json:"download,omitempty"`
	Redirect          *bool    `json:"redirect,omitempty"`
	Entity            *string  `json:"entity,omitempty"`
	NoCache           *bool    `json:"no_cache,omitempty"`
	SkipError         *bool    `json:"skip_error,omitempty"`
	UsePrimarySiteURL *bool    `json:"use_primary_site_url,omitempty"`
	Archive           *bool    `json:"archive,omitempty"`
}

// FileURLResponse represents a file URL response
type FileURLResponse struct {
	URLs    []EntityURLResponse `json:"urls"`
	Expires string              `json:"expires"`
}

// EntityURLResponse represents an entity URL
type EntityURLResponse struct {
	URL                    string  `json:"url"`
	StreamSaverDisplayName *string `json:"stream_saver_display_name,omitempty"`
}

// GetFileInfoRequest represents a file info request
type GetFileInfoRequest struct {
	URI           *string `json:"uri,omitempty"`
	ID            *string `json:"id,omitempty"`
	Extended      *bool   `json:"extended,omitempty"`
	FolderSummary *bool   `json:"folder_summary,omitempty"`
}

// VersionControlRequest represents a version control request
type VersionControlRequest struct {
	URI     string `json:"uri"`
	Version string `json:"version"`
}

// FileUpdateRequest represents a file update request
type FileUpdateRequest struct {
	URI      string  `json:"uri"`
	Previous *string `json:"previous,omitempty"`
}

// CreateViewerSessionRequest represents a viewer session creation request
type CreateViewerSessionRequest struct {
	URI             string  `json:"uri"`
	ViewerID        string  `json:"viewer_id"`
	PreferredAction string  `json:"preferred_action"`
	Version         *string `json:"version,omitempty"`
}

// ViewerSession represents a viewer session
type ViewerSession struct {
	ID          string `json:"id"`
	AccessToken string `json:"access_token"`
	Expires     int    `json:"expires"`
}

// ViewerSessionResponse represents a viewer session response
type ViewerSessionResponse struct {
	Session ViewerSession `json:"session"`
	WOPISrc *string       `json:"wopi_src,omitempty"`
}

// UploadSessionRequest represents an upload session creation request
type UploadSessionRequest struct {
	URI                 string            `json:"uri"`
	Size                int64             `json:"size"`
	PolicyID            string            `json:"policy_id"`
	LastModified        *int64            `json:"last_modified,omitempty"`
	EntityType          *string           `json:"entity_type,omitempty"`
	Metadata            map[string]string `json:"metadata,omitempty"`
	MimeType            *string           `json:"mime_type,omitempty"`
	EncryptionSupported []string          `json:"encryption_supported,omitempty"`
}

// EncryptMetadata represents encryption metadata
type EncryptMetadata struct {
	Algorithm    string `json:"algorithm"`
	KeyPlainText string `json:"key_plain_text"`
	IV           string `json:"iv"`
}

// UploadCredential represents upload credentials
type UploadCredential struct {
	SessionID       string           `json:"session_id"`
	Expires         int              `json:"expires"`
	ChunkSize       int64            `json:"chunk_size"`
	UploadURLs      []string         `json:"upload_urls"`
	Credential      string           `json:"credential"`
	UploadID        string           `json:"uploadID"`
	Callback        string           `json:"callback"`
	AK              string           `json:"ak"`
	KeyTime         string           `json:"keyTime"`
	Path            string           `json:"path"`
	CompleteURL     string           `json:"completeURL"`
	StoragePolicy   *StoragePolicy   `json:"storage_policy,omitempty"`
	URI             string           `json:"uri"`
	CallbackSecret  string           `json:"callback_secret"`
	MimeType        *string          `json:"mime_type,omitempty"`
	UploadPolicy    *string          `json:"upload_policy,omitempty"`
	EncryptMetadata *EncryptMetadata `json:"encrypt_metadata,omitempty"`
}

// DeleteUploadSessionRequest represents an upload session deletion request
type DeleteUploadSessionRequest struct {
	ID  string `json:"id"`
	URI string `json:"uri"`
}

// PatchViewSyncRequest represents a view sync patch request
type PatchViewSyncRequest struct {
	URI  string        `json:"uri"`
	View *ExplorerView `json:"view,omitempty"`
}

// ArchivedFile represents a file in an archive
type ArchivedFile struct {
	Name        string     `json:"name"`
	Size        int64      `json:"size"`
	UpdatedAt   *time.Time `json:"updated_at,omitempty"`
	IsDirectory bool       `json:"is_directory"`
}

// ArchiveListFilesResponse represents an archive file list response
type ArchiveListFilesResponse struct {
	Files []ArchivedFile `json:"files"`
}

// ArchiveListFilesRequest represents an archive file list request
type ArchiveListFilesRequest struct {
	URI          string  `json:"uri"`
	Entity       *string `json:"entity,omitempty"`
	TextEncoding *string `json:"text_encoding,omitempty"`
}
