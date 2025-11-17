package models

import "time"

// ArchiveWorkflowRequest represents an archive workflow request
type ArchiveWorkflowRequest struct {
	Src      []string `json:"src"`
	Dst      string   `json:"dst"`
	Encoding *string  `json:"encoding,omitempty"`
	Password *string  `json:"password,omitempty"`
	FileMask []string `json:"file_mask,omitempty"`
}

// TaskListResponse represents a task list response
type TaskListResponse struct {
	Tasks      []TaskResponse    `json:"tasks"`
	Pagination PaginationResults `json:"pagination"`
}

// TaskResponse represents a task
type TaskResponse struct {
	CreatedAt    time.Time    `json:"created_at"`
	UpdatedAt    time.Time    `json:"updated_at"`
	ID           string       `json:"id"`
	Status       string       `json:"status"`
	Type         string       `json:"type"`
	Node         *NodeSummary `json:"node,omitempty"`
	Summary      *TaskSummary `json:"summary,omitempty"`
	Error        *string      `json:"error,omitempty"`
	ErrorHistory []string     `json:"error_history,omitempty"`
	Duration     *int         `json:"duration,omitempty"`
	ResumeTime   *int         `json:"resume_time,omitempty"`
	RetryCount   *int         `json:"retry_count,omitempty"`
}

// TaskSummary represents task summary information
type TaskSummary struct {
	Phase *string          `json:"phase,omitempty"`
	Props TaskSummaryProps `json:"props"`
}

// TaskSummaryProps represents task summary properties
type TaskSummaryProps struct {
	Src         *string             `json:"src,omitempty"`
	SrcStr      *string             `json:"src_str,omitempty"`
	Dst         *string             `json:"dst,omitempty"`
	SrcMultiple []string            `json:"src_multiple,omitempty"`
	DstPolicyID *string             `json:"dst_policy_id,omitempty"`
	Failed      *int                `json:"failed,omitempty"`
	Download    *DownloadTaskStatus `json:"download,omitempty"`
}

// DownloadTaskState represents download task state
type DownloadTaskState string

const (
	DownloadTaskStateSeeding     DownloadTaskState = "seeding"
	DownloadTaskStateDownloading DownloadTaskState = "downloading"
	DownloadTaskStateError       DownloadTaskState = "error"
	DownloadTaskStateCompleted   DownloadTaskState = "completed"
	DownloadTaskStateUnknown     DownloadTaskState = "unknown"
)

// DownloadTaskStatus represents download task status
type DownloadTaskStatus struct {
	Name          string             `json:"name"`
	State         DownloadTaskState  `json:"state"`
	Total         int64              `json:"total"`
	Downloaded    int64              `json:"downloaded"`
	DownloadSpeed int64              `json:"download_speed"`
	UploadSpeed   int64              `json:"upload_speed"`
	Uploaded      int64              `json:"uploaded"`
	Files         []DownloadTaskFile `json:"files,omitempty"`
	Hash          *string            `json:"hash,omitempty"`
	Pieces        *string            `json:"pieces,omitempty"`
	NumPieces     *int               `json:"num_pieces,omitempty"`
}

// DownloadTaskFile represents a file in a download task
type DownloadTaskFile struct {
	Index    int     `json:"index"`
	Name     string  `json:"name"`
	Size     int64   `json:"size"`
	Progress float64 `json:"progress"`
	Selected bool    `json:"selected"`
}

// NodeSummary represents a node summary
type NodeSummary struct {
	ID           string `json:"id"`
	Name         string `json:"name"`
	Type         string `json:"type"`
	Capabilities string `json:"capabilities"`
}

// NodeTypes represents node types
type NodeTypes string

const (
	NodeTypeMaster NodeTypes = "master"
	NodeTypeSlave  NodeTypes = "slave"
)

// DownloadWorkflowRequest represents a download workflow request
type DownloadWorkflowRequest struct {
	Src     []string `json:"src,omitempty"`
	SrcFile *string  `json:"src_file,omitempty"`
	Dst     string   `json:"dst"`
}

// ImportWorkflowRequest represents an import workflow request
type ImportWorkflowRequest struct {
	Src              string `json:"src"`
	Dst              string `json:"dst"`
	ExtractMediaMeta *bool  `json:"extract_media_meta,omitempty"`
	UserID           string `json:"user_id"`
	Recursive        *bool  `json:"recursive,omitempty"`
	PolicyID         int    `json:"policy_id"`
}

// ListTaskRequest represents a task list request
type ListTaskRequest struct {
	PageSize      int              `json:"page_size"`
	Category      ListTaskCategory `json:"category"`
	NextPageToken *string          `json:"next_page_token,omitempty"`
}

// ListTaskCategory represents task list category
type ListTaskCategory string

const (
	ListTaskCategoryGeneral     ListTaskCategory = "general"
	ListTaskCategoryDownloading ListTaskCategory = "downloading"
	ListTaskCategoryDownloaded  ListTaskCategory = "downloaded"
)

// TaskType represents task types
type TaskType string

const (
	TaskTypeCreateArchive         TaskType = "create_archive"
	TaskTypeExtractArchive        TaskType = "extract_archive"
	TaskTypeRemoteDownload        TaskType = "remote_download"
	TaskTypeMediaMetadata         TaskType = "media_meta"
	TaskTypeEntityRecycleRoutine  TaskType = "entity_recycle_routine"
	TaskTypeExplicitEntityRecycle TaskType = "explicit_entity_recycle"
	TaskTypeUploadSentinelCheck   TaskType = "upload_sentinel_check"
	TaskTypeImport                TaskType = "import"
)

// TaskStatus represents task status
type TaskStatus string

const (
	TaskStatusQueued     TaskStatus = "queued"
	TaskStatusProcessing TaskStatus = "processing"
	TaskStatusSuspending TaskStatus = "suspending"
	TaskStatusError      TaskStatus = "error"
	TaskStatusCanceled   TaskStatus = "canceled"
	TaskStatusCompleted  TaskStatus = "completed"
)

// TaskProgress represents task progress
type TaskProgress struct {
	Total      int    `json:"total"`
	Current    int    `json:"current"`
	Identifier string `json:"identifier"`
}

// TaskProgresses represents multiple task progresses
type TaskProgresses map[string]TaskProgress

// SetFileToDownloadArgs represents file download selection
type SetFileToDownloadArgs struct {
	Index    int  `json:"index"`
	Download bool `json:"download"`
}

// SetDownloadFilesRequest represents a download files selection request
type SetDownloadFilesRequest struct {
	Files []SetFileToDownloadArgs `json:"files"`
}
