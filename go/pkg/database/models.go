package database

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

// Account represents a Cloudreve account
type Account struct {
	ID           uuid.UUID  `gorm:"type:uuid;primary_key"`
	Name         string     `gorm:"not null"`            // User-defined account name
	ServerURL    string     `gorm:"not null"`            // Cloudreve server URL
	AccessToken  string     `gorm:""`                    // Current access token
	RefreshToken string     `gorm:""`                    // Current refresh token
	TokenExpires *time.Time `gorm:""`                    // Token expiration time
	UserID       string     `gorm:""`                    // User ID from server
	Email        string     `gorm:""`                    // User email
	IsActive     bool       `gorm:"default:false;index"` // Currently active account
	LastLoginAt  *time.Time `gorm:""`                    // Last login time
	CreatedAt    time.Time  `gorm:"autoCreateTime"`
	UpdatedAt    time.Time  `gorm:"autoUpdateTime"`
}

// BeforeCreate hook to generate UUID
func (a *Account) BeforeCreate(tx *gorm.DB) error {
	if a.ID == uuid.Nil {
		a.ID = uuid.New()
	}
	return nil
}

// TaskStatus represents the status of a task
type TaskStatus string

const (
	TaskStatusWaiting   TaskStatus = "waiting"
	TaskStatusRunning   TaskStatus = "running"
	TaskStatusPaused    TaskStatus = "paused"
	TaskStatusCompleted TaskStatus = "completed"
	TaskStatusFailed    TaskStatus = "failed"
	TaskStatusCancelled TaskStatus = "cancelled"
)

// TaskType represents the type of a task
type TaskType string

const (
	TaskTypeNormal TaskType = "normal"
	TaskTypeBatch  TaskType = "batch"
	TaskTypeSync   TaskType = "sync"
)

// DownloadTask represents a download task in the database
type DownloadTask struct {
	ID             uuid.UUID  `gorm:"type:uuid;primary_key"`
	AccountID      uuid.UUID  `gorm:"type:uuid;index;not null"` // Associated account
	FileID         string     `gorm:"index;not null"`
	FileName       string     `gorm:"not null"`
	URI            string     `gorm:""`
	SavePath       string     `gorm:"not null"`
	TotalSize      int64      `gorm:"default:0"`
	DownloadedSize int64      `gorm:"default:0"`
	Status         TaskStatus `gorm:"index;default:'waiting'"`
	Type           TaskType   `gorm:"index;default:'normal'"`
	Error          string     `gorm:""`
	Speed          float64    `gorm:"default:0"`
	Progress       float64    `gorm:"default:0"`
	CreatedAt      time.Time  `gorm:"autoCreateTime"`
	UpdatedAt      time.Time  `gorm:"autoUpdateTime"`
	CompletedAt    *time.Time `gorm:""`
}

// BeforeCreate hook to generate UUID
func (d *DownloadTask) BeforeCreate(tx *gorm.DB) error {
	if d.ID == uuid.Nil {
		d.ID = uuid.New()
	}
	return nil
}

// UploadTask represents an upload task in the database
type UploadTask struct {
	ID           uuid.UUID  `gorm:"type:uuid;primary_key"`
	AccountID    uuid.UUID  `gorm:"type:uuid;index;not null"` // Associated account
	LocalPath    string     `gorm:"not null"`
	RemotePath   string     `gorm:"not null"`
	FileName     string     `gorm:"not null"`
	TotalSize    int64      `gorm:"default:0"`
	UploadedSize int64      `gorm:"default:0"`
	Status       TaskStatus `gorm:"index;default:'waiting'"`
	Error        string     `gorm:""`
	Speed        float64    `gorm:"default:0"`
	Progress     float64    `gorm:"default:0"`
	SessionID    string     `gorm:""`
	CreatedAt    time.Time  `gorm:"autoCreateTime"`
	UpdatedAt    time.Time  `gorm:"autoUpdateTime"`
	CompletedAt  *time.Time `gorm:""`
}

// BeforeCreate hook to generate UUID
func (u *UploadTask) BeforeCreate(tx *gorm.DB) error {
	if u.ID == uuid.Nil {
		u.ID = uuid.New()
	}
	return nil
}
