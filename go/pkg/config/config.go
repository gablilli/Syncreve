package config

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"
)

// Config represents the global configuration
type Config struct {
	WorkingDir string
	SocketPath string
	DBPath     string
	UseTCP     bool // Use TCP port instead of Unix socket
	Port       int  // TCP port (default: 52123)
}

// DefaultWorkingDir returns the default working directory
// For mobile: must be provided by the app
// For desktop/server: ~/.Syncreve
func DefaultWorkingDir() (string, error) {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		return "", fmt.Errorf("failed to get user home directory: %w", err)
	}

	workingDir := filepath.Join(homeDir, ".Syncreve")
	return workingDir, nil
}

// New creates a new Config instance
// workingDir: if empty, uses default (~/.Syncreve)
// useTCP: true for desktop (use TCP port), false for mobile (use Unix socket)
// port: TCP port to use (default: 52123)
func New(workingDir string, useTCP bool, port int) (*Config, error) {
	// Use default if not provided
	if workingDir == "" {
		var err error
		workingDir, err = DefaultWorkingDir()
		if err != nil {
			return nil, err
		}
	}

	// Create working directory if not exists
	if err := os.MkdirAll(workingDir, 0755); err != nil {
		return nil, fmt.Errorf("failed to create working directory: %w", err)
	}

	// Set default port if not specified
	if port == 0 {
		port = 52123
	}

	// Set socket path based on platform
	socketPath := filepath.Join(workingDir, "syncreve.sock")
	if runtime.GOOS == "windows" && !useTCP {
		// Windows uses named pipe for Unix socket mode
		socketPath = `\\.\pipe\syncreve`
	}

	config := &Config{
		WorkingDir: workingDir,
		SocketPath: socketPath,
		DBPath:     filepath.Join(workingDir, "syncreve.db"),
		UseTCP:     useTCP,
		Port:       port,
	}

	return config, nil
}

// EnsureDirectories creates necessary subdirectories
func (c *Config) EnsureDirectories() error {
	// Create logs directory
	logsDir := filepath.Join(c.WorkingDir, "logs")
	if err := os.MkdirAll(logsDir, 0755); err != nil {
		return fmt.Errorf("failed to create logs directory: %w", err)
	}

	// Create temp directory
	tempDir := filepath.Join(c.WorkingDir, "temp")
	if err := os.MkdirAll(tempDir, 0755); err != nil {
		return fmt.Errorf("failed to create temp directory: %w", err)
	}

	return nil
}

// GetLogsDir returns the logs directory path
func (c *Config) GetLogsDir() string {
	return filepath.Join(c.WorkingDir, "logs")
}

// GetTempDir returns the temp directory path
func (c *Config) GetTempDir() string {
	return filepath.Join(c.WorkingDir, "temp")
}

// GetAddress returns the server address (TCP or Unix socket)
func (c *Config) GetAddress() string {
	if c.UseTCP {
		return fmt.Sprintf("localhost:%d", c.Port)
	}
	return c.SocketPath
}
