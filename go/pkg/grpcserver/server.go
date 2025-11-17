package grpcserver

import (
	"context"
	"fmt"
	"net"
	"os"

	"github.com/xkeyC/Syncreve/pkg/config"
	"github.com/xkeyC/Syncreve/pkg/database"
	pb "github.com/xkeyC/Syncreve/pkg/grpc/protos"
	"github.com/xkeyC/Syncreve/pkg/manager"
	"google.golang.org/grpc"
	"gorm.io/gorm"
)

// Server holds the gRPC server and its dependencies
type Server struct {
	grpcServer      *grpc.Server
	config          *config.Config
	db              *gorm.DB
	accountManager  *manager.AccountManager
	downloadManager *manager.DownloadManager
	uploadManager   *manager.UploadManager
}

// NewServer creates a new gRPC server
// workingDir: if empty, uses default (~/.Syncreve)
// useTCP: true for desktop (use TCP port), false for mobile (use Unix socket)
// port: TCP port to use (default: 52123 if 0)
func NewServer(workingDir string, useTCP bool, port int) (*Server, error) {
	// Create config
	cfg, err := config.New(workingDir, useTCP, port)
	if err != nil {
		return nil, fmt.Errorf("failed to create config: %w", err)
	}

	// Ensure necessary directories
	if err := cfg.EnsureDirectories(); err != nil {
		return nil, fmt.Errorf("failed to create directories: %w", err)
	}

	// Initialize database
	if err := database.Init(cfg.WorkingDir); err != nil {
		return nil, fmt.Errorf("failed to initialize database: %w", err)
	}

	// Create account manager
	accountManager := manager.NewAccountManager(database.DB)

	// Create download/upload managers
	downloadManager := manager.NewDownloadManager(accountManager, database.DB, 3)
	uploadManager := manager.NewUploadManager(accountManager, database.DB, 3)

	s := &Server{
		config:          cfg,
		db:              database.DB,
		accountManager:  accountManager,
		downloadManager: downloadManager,
		uploadManager:   uploadManager,
	}

	// Create gRPC server
	s.grpcServer = grpc.NewServer()

	// Register services
	pb.RegisterPingServiceServer(s.grpcServer, &pingService{})
	pb.RegisterAuthServiceServer(s.grpcServer, &authService{accountMgr: accountManager})
	pb.RegisterFileServiceServer(s.grpcServer, &fileService{accountMgr: accountManager})
	pb.RegisterDownloadServiceServer(s.grpcServer, &downloadService{
		accountMgr: accountManager,
		manager:    downloadManager,
	})
	pb.RegisterUploadServiceServer(s.grpcServer, &uploadService{
		accountMgr: accountManager,
		manager:    uploadManager,
	})

	return s, nil
}

// Start starts the gRPC server on TCP port or Unix socket
func (s *Server) Start() error {
	var listener net.Listener
	var err error

	if s.config.UseTCP {
		// TCP mode for desktop platforms
		addr := fmt.Sprintf("localhost:%d", s.config.Port)
		listener, err = net.Listen("tcp", addr)
		if err != nil {
			return fmt.Errorf("failed to listen on TCP port: %w", err)
		}
		fmt.Printf("gRPC server started on TCP: %s\n", addr)
	} else {
		// Unix socket mode for mobile platforms
		sockPath := s.config.SocketPath

		// Remove existing socket file if it exists (Unix only)
		if _, err := os.Stat(sockPath); err == nil {
			if err := os.Remove(sockPath); err != nil {
				return fmt.Errorf("failed to remove existing socket: %w", err)
			}
		}

		// Create listener
		listener, err = net.Listen("unix", sockPath)
		if err != nil {
			return fmt.Errorf("failed to listen on socket: %w", err)
		}
		fmt.Printf("gRPC server started on Unix socket: %s\n", sockPath)
	}

	// Start serving
	return s.grpcServer.Serve(listener)
}

// Stop stops the gRPC server
func (s *Server) Stop() error {
	s.grpcServer.GracefulStop()

	if s.downloadManager != nil {
		s.downloadManager.Close()
	}
	if s.uploadManager != nil {
		s.uploadManager.Close()
	}
	if s.accountManager != nil {
		s.accountManager.Close()
	}
	if s.db != nil {
		database.Close()
	}

	return nil
}

// Ping service implementation
type pingService struct {
	pb.UnimplementedPingServiceServer
}

func (p *pingService) Ping(ctx context.Context, req *pb.PingRequest) (*pb.PingResponse, error) {
	return &pb.PingResponse{
		Message:   "pong: " + req.Message,
		Timestamp: fmt.Sprintf("%d", context.Background()),
	}, nil
}
