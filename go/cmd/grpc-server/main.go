package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/signal"
	"syscall"

	"github.com/xkeyC/Syncreve/pkg/config"
	"github.com/xkeyC/Syncreve/pkg/grpcserver"
)

var (
	workingDir = flag.String("dir", "", "Working directory (default: ~/.Syncreve)")
	port       = flag.Int("port", 52123, "TCP port to listen on (default: 52123)")
	debug      = flag.Bool("debug", false, "Enable debug mode")
	version    = flag.Bool("version", false, "Show version information")
)

const (
	AppVersion = "1.0.0"
	AppName    = "Syncreve gRPC Server"
)

func main() {
	flag.Parse()

	// Show version
	if *version {
		fmt.Printf("%s v%s\n", AppName, AppVersion)
		fmt.Println("A gRPC service for Cloudreve API with download/upload management")
		return
	}

	// Get default working directory if not specified
	if *workingDir == "" {
		defaultDir, err := config.DefaultWorkingDir()
		if err != nil {
			log.Fatalf("Failed to get default working directory: %v", err)
		}
		*workingDir = defaultDir
	}

	// Print banner
	fmt.Println("========================================")
	fmt.Printf("  %s v%s\n", AppName, AppVersion)
	fmt.Println("========================================")
	fmt.Printf("Working Dir:    %s\n", *workingDir)
	fmt.Printf("TCP Port:       %d\n", *port)
	fmt.Printf("Debug Mode:     %v\n", *debug)
	fmt.Println("========================================")

	// Create gRPC server (desktop mode: use TCP)
	server, err := grpcserver.NewServer(*workingDir, true, *port)
	if err != nil {
		log.Fatalf("Failed to create gRPC server: %v", err)
	}

	// Start server in goroutine
	serverErrors := make(chan error, 1)
	go func() {
		fmt.Println("\n🚀 Starting gRPC server...")
		if err := server.Start(); err != nil {
			serverErrors <- err
		}
	}()

	fmt.Println("\n📝 Service Information:")
	fmt.Println("   - Multi-account support enabled")
	fmt.Println("   - Download Manager: Available (max 3 concurrent)")
	fmt.Println("   - Upload Manager: Available (max 3 concurrent)")
	fmt.Println("   - Task Queue: Enabled with SQLite persistence")
	fmt.Println("\n💡 Tips:")
	fmt.Println("   - Use Auth service to manage accounts")
	fmt.Println("   - All operations require account_id parameter")
	fmt.Printf("   - Database location: %s/syncreve.db\n", *workingDir)

	// Wait for interrupt signal or server error
	fmt.Println("\n⏳ Press Ctrl+C to stop the server...")
	sigChan := make(chan os.Signal, 1)
	signal.Notify(sigChan, os.Interrupt, syscall.SIGTERM)

	select {
	case err := <-serverErrors:
		log.Fatalf("❌ Server error: %v", err)
	case sig := <-sigChan:
		fmt.Printf("\n\n🛑 Received signal: %v\n", sig)
	}

	// Graceful shutdown
	fmt.Println("🔄 Shutting down gracefully...")
	if err := server.Stop(); err != nil {
		log.Printf("Warning: Error during shutdown: %v", err)
	}

	fmt.Println("✅ Server stopped successfully")
	fmt.Println("👋 Goodbye!")
}
