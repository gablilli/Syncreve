package mobile

import (
	"fmt"

	"github.com/xkeyC/Syncreve/pkg/grpcserver"
)

var (
	server *grpcserver.Server
)

// StartService starts the Syncreve service
// workingDir: directory for database and socket (required for mobile)
// This function is compatible with gomobile
func StartService(workingDir string) error {
	if workingDir == "" {
		return fmt.Errorf("workingDir is required for mobile service")
	}

	fmt.Println("[Syncreve] Starting service...")
	fmt.Printf("[Syncreve] WorkingDir: %s\n", workingDir)

	var err error
	// Mobile mode: use Unix socket (useTCP=false, port is ignored)
	server, err = grpcserver.NewServer(workingDir, false, 0)
	if err != nil {
		return fmt.Errorf("failed to create gRPC server: %w", err)
	}

	// Start server in background
	go func() {
		if err := server.Start(); err != nil {
			fmt.Printf("[Syncreve] Server error: %v\n", err)
		}
	}()

	fmt.Println("[Syncreve] Service started successfully")
	return nil
}

// StopService stops the Syncreve service
func StopService() error {
	fmt.Println("[Syncreve] Stopping service...")

	if server != nil {
		if err := server.Stop(); err != nil {
			return fmt.Errorf("failed to stop server: %w", err)
		}
		server = nil
	}

	fmt.Println("[Syncreve] Service stopped successfully")
	return nil
}

// IsServiceRunning checks if the service is currently running
func IsServiceRunning() bool {
	return server != nil
}
