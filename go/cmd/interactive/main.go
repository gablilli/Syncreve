package main

import (
	"bufio"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"
	"syscall"

	"github.com/xkeyC/Syncreve/pkg/client"
	"github.com/xkeyC/Syncreve/pkg/models"
	"golang.org/x/term"
)

type SessionConfig struct {
	BaseURL string `json:"base_url"`
}

type Shell struct {
	client      *client.Client
	currentPath string
	ctx         context.Context
	configPath  string
}

func main() {
	fmt.Println("=== Syncreve Interactive Shell ===")
	fmt.Println("Type 'help' for available commands, 'exit' to quit")
	fmt.Println()

	homeDir, _ := os.UserHomeDir()
	configDir := filepath.Join(homeDir, ".syncreve")
	configPath := filepath.Join(configDir, "config.json")

	shell := &Shell{
		currentPath: "cloudreve://my",
		ctx:         context.Background(),
		configPath:  configPath,
	}

	// Try to restore previous session
	shell.tryAutoLogin()

	reader := bufio.NewReader(os.Stdin)

	for {
		fmt.Printf("%s> ", shell.currentPath)

		input, err := reader.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				fmt.Println("\nBye!")
				break
			}
			fmt.Printf("Error reading input: %v\n", err)
			continue
		}

		input = strings.TrimSpace(input)
		if input == "" {
			continue
		}

		parts := strings.Fields(input)
		cmd := parts[0]
		args := parts[1:]

		switch cmd {
		case "help":
			shell.showHelp()
		case "exit", "quit":
			fmt.Println("Bye!")
			if shell.client != nil {
				shell.client.Close()
			}
			return
		case "login":
			shell.login(args)
		case "logout":
			shell.logout()
		case "ls":
			shell.ls(args)
		case "cd":
			shell.cd(args)
		case "pwd":
			shell.pwd()
		case "download":
			shell.download(args)
		case "upload":
			shell.upload(args)
		case "mkdir":
			shell.mkdir(args)
		case "rm":
			shell.rm(args)
		case "mv":
			shell.mv(args)
		case "cat":
			shell.cat(args)
		case "info":
			shell.info(args)
		default:
			fmt.Printf("Unknown command: %s. Type 'help' for available commands.\n", cmd)
		}
	}
}

func (s *Shell) showHelp() {
	help := `Available commands:
  login [url]          - Login to Syncreve server
  logout               - Logout from current session
  ls [path]            - List files in current or specified directory
  cd <path>            - Change current directory
  pwd                  - Print current directory
  download <file> [dest] - Download a file
  upload <local> [remote] - Upload a file
  mkdir <name>         - Create a directory
  rm <path>            - Delete a file or directory
  mv <src> <dst>       - Move/rename a file or directory
  cat <file>           - Show file content (for text files)
  info [path]          - Show detailed file information
  help                 - Show this help message
  exit/quit            - Exit the shell
`
	fmt.Println(help)
}

func (s *Shell) login(args []string) {
	if s.client != nil {
		fmt.Println("Already logged in. Please logout first.")
		return
	}

	baseURL := ""
	if len(args) > 0 {
		baseURL = args[0]
	} else {
		fmt.Print("Server URL: ")
		fmt.Scanln(&baseURL)
	}

	if baseURL == "" {
		fmt.Println("Error: Server URL is required")
		return
	}

	fmt.Print("Email: ")
	var email string
	fmt.Scanln(&email)

	fmt.Print("Password: ")
	bytePwd, err := term.ReadPassword(int(syscall.Stdin))
	if err != nil {
		fmt.Printf("\nError reading password: %v\n", err)
		return
	}
	password := string(bytePwd)
	fmt.Println()

	homeDir, _ := os.UserHomeDir()
	cfg := client.Config{
		BaseURL:   baseURL,
		TokenPath: filepath.Join(homeDir, ".syncreve", "token.json"),
		EnableLog: true, // Disable HTTP logs for cleaner output
	}

	c, err := client.NewClient(cfg)
	if err != nil {
		fmt.Printf("Failed to create client: %v\n", err)
		return
	}

	loginResp, err := c.Login(s.ctx, &models.PasswordLoginRequest{
		Email:    email,
		Password: password,
	})
	if err != nil {
		fmt.Printf("Login failed: %v\n", err)
		c.Close()
		return
	}

	s.client = c
	userEmail := ""
	if loginResp.User.Email != nil {
		userEmail = *loginResp.User.Email
	}
	fmt.Printf("✓ Logged in as: %s (%s)\n", loginResp.User.Nickname, userEmail)

	// Save config
	s.saveConfig(baseURL)
}

func (s *Shell) tryAutoLogin() {
	// Load config
	config, err := s.loadConfig()
	if err != nil || config.BaseURL == "" {
		return
	}

	homeDir, _ := os.UserHomeDir()
	cfg := client.Config{
		BaseURL:   config.BaseURL,
		TokenPath: filepath.Join(homeDir, ".syncreve", "token.json"),
		EnableLog: false,
	}

	c, err := client.NewClient(cfg)
	if err != nil {
		return
	}

	// Try to get user info to check if session is still valid
	user, err := c.GetUserMe(s.ctx)
	if err != nil {
		c.Close()
		return
	}

	// Successfully restored session
	s.client = c
	userEmail := ""
	if user.Email != nil {
		userEmail = *user.Email
	}
	fmt.Printf("✓ Restored session: %s (%s)\n", user.Nickname, userEmail)
}

func (s *Shell) saveConfig(baseURL string) error {
	config := SessionConfig{
		BaseURL: baseURL,
	}

	data, err := json.MarshalIndent(config, "", "  ")
	if err != nil {
		return err
	}

	dir := filepath.Dir(s.configPath)
	if err := os.MkdirAll(dir, 0700); err != nil {
		return err
	}

	return os.WriteFile(s.configPath, data, 0600)
}

func (s *Shell) loadConfig() (*SessionConfig, error) {
	data, err := os.ReadFile(s.configPath)
	if err != nil {
		return nil, err
	}

	var config SessionConfig
	if err := json.Unmarshal(data, &config); err != nil {
		return nil, err
	}

	return &config, nil
}

func (s *Shell) logout() {
	if s.client == nil {
		fmt.Println("Not logged in")
		return
	}

	refreshToken := s.client.GetRefreshToken()
	if refreshToken != "" {
		s.client.Signout(s.ctx, &models.RefreshTokenRequest{
			RefreshToken: refreshToken,
		})
	}

	s.client.ClearToken()
	s.client.Close()
	s.client = nil
	s.currentPath = "cloudreve://my"

	// Clear saved config
	_ = os.Remove(s.configPath)

	fmt.Println("✓ Logged out")
}

func (s *Shell) ls(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	path := s.currentPath
	if len(args) > 0 {
		path = s.resolvePath(args[0])
	}

	page := 1
	pageSize := 100

	resp, err := s.client.ListFiles(s.ctx, &models.ListFileRequest{
		URI:      path,
		Page:     &page,
		PageSize: &pageSize,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if len(resp.Files) == 0 {
		fmt.Println("(empty)")
		return
	}

	for _, file := range resp.Files {
		icon := "📄"
		if file.Type == models.FileTypeFolder {
			icon = "📁"
		}

		size := formatSize(file.Size)
		fmt.Printf("%s  %-40s  %10s  %s\n",
			icon,
			file.Name,
			size,
			file.UpdatedAt.Format("2006-01-02 15:04"),
		)
	}

	fmt.Printf("\nTotal: %d items\n", len(resp.Files))
}

func (s *Shell) cd(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		s.currentPath = "cloudreve://my"
		return
	}

	newPath := s.resolvePath(args[0])

	fileInfo, err := s.client.GetFileInfo(s.ctx, &models.GetFileInfoRequest{
		URI: &newPath,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if fileInfo.Type != models.FileTypeFolder {
		fmt.Printf("Error: '%s' is not a directory\n", newPath)
		return
	}

	s.currentPath = newPath
}

func (s *Shell) pwd() {
	fmt.Println(s.currentPath)
}

func (s *Shell) download(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		fmt.Println("Usage: download <remote-file> [local-path]")
		return
	}

	remotePath := s.resolvePath(args[0])
	localPath := "./"
	if len(args) > 1 {
		localPath = args[1]
	}

	fileInfo, err := s.client.GetFileInfo(s.ctx, &models.GetFileInfoRequest{
		URI: &remotePath,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if fileInfo.Type == models.FileTypeFolder {
		fmt.Println("Error: Cannot download directory")
		return
	}

	download := true
	urlResp, err := s.client.GetFileURL(s.ctx, &models.FileURLRequest{
		URIs:     []string{remotePath},
		Download: &download,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if len(urlResp.URLs) == 0 {
		fmt.Println("Error: No download URL returned")
		return
	}

	downloadURL := urlResp.URLs[0].URL

	if stat, err := os.Stat(localPath); err == nil && stat.IsDir() {
		localPath = filepath.Join(localPath, fileInfo.Name)
	}

	fmt.Printf("Downloading '%s' to '%s'...\n", fileInfo.Name, localPath)

	resp, err := s.client.Resty.R().
		SetContext(s.ctx).
		SetOutput(localPath).
		Get(downloadURL)

	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if !resp.IsSuccess() {
		fmt.Printf("Error: HTTP %d\n", resp.StatusCode())
		return
	}

	fmt.Printf("✓ Downloaded (%s)\n", formatSize(fileInfo.Size))
}

func (s *Shell) upload(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		fmt.Println("Usage: upload <local-file> [remote-path]")
		return
	}

	localPath := args[0]
	remotePath := s.currentPath
	if len(args) > 1 {
		remotePath = s.resolvePath(args[1])
	}

	file, err := os.Open(localPath)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	defer file.Close()

	stat, err := file.Stat()
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if stat.IsDir() {
		fmt.Println("Error: Cannot upload directory")
		return
	}

	if !strings.HasSuffix(remotePath, "/") && !strings.Contains(filepath.Base(remotePath), ".") {
		remotePath = filepath.Join(remotePath, filepath.Base(localPath))
	} else if strings.HasSuffix(remotePath, "/") {
		remotePath = filepath.Join(remotePath, filepath.Base(localPath))
	}

	fmt.Printf("Uploading '%s' (%s)...\n", filepath.Base(localPath), formatSize(stat.Size()))

	cred, err := s.client.CreateUploadSession(s.ctx, &models.UploadSessionRequest{
		URI:      remotePath,
		Size:     stat.Size(),
		PolicyID: "1",
	})
	if err != nil {
		fmt.Printf("Error creating upload session: %v\n", err)
		return
	}

	chunkSize := cred.ChunkSize
	if chunkSize == 0 {
		chunkSize = 5 * 1024 * 1024
	}

	buffer := make([]byte, chunkSize)
	chunkIndex := 0
	uploaded := int64(0)

	for {
		n, err := file.Read(buffer)
		if err != nil && err != io.EOF {
			fmt.Printf("\nError reading file: %v\n", err)
			return
		}

		if n == 0 {
			break
		}

		_, err = s.client.UploadChunk(s.ctx, cred.SessionID, buffer[:n], chunkIndex)
		if err != nil {
			fmt.Printf("\nError uploading chunk: %v\n", err)
			return
		}

		uploaded += int64(n)
		progress := float64(uploaded) / float64(stat.Size()) * 100
		fmt.Printf("\rProgress: %.1f%%", progress)

		chunkIndex++

		if err == io.EOF {
			break
		}
	}

	fmt.Printf("\n✓ Upload completed\n")
}

func (s *Shell) mkdir(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		fmt.Println("Usage: mkdir <directory-name>")
		return
	}

	path := s.resolvePath(args[0])

	_, err := s.client.CreateFile(s.ctx, &models.CreateFileRequest{
		URI:  path,
		Type: "folder",
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	fmt.Printf("✓ Created directory: %s\n", path)
}

func (s *Shell) rm(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		fmt.Println("Usage: rm <path>")
		return
	}

	path := s.resolvePath(args[0])

	fmt.Printf("Delete '%s'? (y/N): ", path)
	var confirm string
	fmt.Scanln(&confirm)

	if strings.ToLower(confirm) != "y" {
		fmt.Println("Cancelled")
		return
	}

	err := s.client.DeleteFiles(s.ctx, &models.DeleteFileRequest{
		URIs: []string{path},
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	fmt.Printf("✓ Deleted: %s\n", path)
}

func (s *Shell) mv(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) < 2 {
		fmt.Println("Usage: mv <source> <destination>")
		return
	}

	src := s.resolvePath(args[0])
	dst := s.resolvePath(args[1])

	err := s.client.MoveFiles(s.ctx, &models.MoveFileRequest{
		URIs: []string{src},
		Dst:  dst,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	fmt.Printf("✓ Moved '%s' to '%s'\n", src, dst)
}

func (s *Shell) cat(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	if len(args) == 0 {
		fmt.Println("Usage: cat <file>")
		return
	}

	path := s.resolvePath(args[0])

	fileInfo, err := s.client.GetFileInfo(s.ctx, &models.GetFileInfoRequest{
		URI: &path,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if fileInfo.Type == models.FileTypeFolder {
		fmt.Println("Error: Cannot display directory content")
		return
	}

	download := true
	urlResp, err := s.client.GetFileURL(s.ctx, &models.FileURLRequest{
		URIs:     []string{path},
		Download: &download,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if len(urlResp.URLs) == 0 {
		fmt.Println("Error: No download URL returned")
		return
	}

	resp, err := s.client.Resty.R().
		SetContext(s.ctx).
		Get(urlResp.URLs[0].URL)

	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	if !resp.IsSuccess() {
		fmt.Printf("Error: HTTP %d\n", resp.StatusCode())
		return
	}

	fmt.Println(string(resp.Body()))
}

func (s *Shell) info(args []string) {
	if s.client == nil {
		fmt.Println("Error: Not logged in. Use 'login' command first.")
		return
	}

	path := s.currentPath
	if len(args) > 0 {
		path = s.resolvePath(args[0])
	}

	extended := true
	fileInfo, err := s.client.GetFileInfo(s.ctx, &models.GetFileInfoRequest{
		URI:      &path,
		Extended: &extended,
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	fileType := "File"
	if fileInfo.Type == models.FileTypeFolder {
		fileType = "Directory"
	}

	fmt.Printf("Path: %s\n", fileInfo.Path)
	fmt.Printf("Name: %s\n", fileInfo.Name)
	fmt.Printf("Type: %s\n", fileType)
	fmt.Printf("Size: %s (%d bytes)\n", formatSize(fileInfo.Size), fileInfo.Size)
	fmt.Printf("Created: %s\n", fileInfo.CreatedAt.Format("2006-01-02 15:04:05"))
	fmt.Printf("Modified: %s\n", fileInfo.UpdatedAt.Format("2006-01-02 15:04:05"))

	if fileInfo.ExtendedInfo != nil && fileInfo.ExtendedInfo.StoragePolicy != nil {
		fmt.Printf("Storage Policy: %s (%s)\n",
			fileInfo.ExtendedInfo.StoragePolicy.Name,
			fileInfo.ExtendedInfo.StoragePolicy.Type)
	}
}

func (s *Shell) resolvePath(path string) string {
	// If absolute path (starts with / or cloudreve://)
	if strings.HasPrefix(path, "/") {
		// Convert / to cloudreve://my
		if path == "/" {
			return "cloudreve://my"
		}
		// Convert /xxx to cloudreve://my/xxx
		return "cloudreve://my" + path
	}
	if strings.HasPrefix(path, "cloudreve://") {
		return path
	}

	if path == ".." {
		if s.currentPath == "cloudreve://my" {
			return "cloudreve://my"
		}
		// Parse cloudreve://my/a/b -> cloudreve://my/a
		lastSlash := strings.LastIndex(s.currentPath, "/")
		if lastSlash <= len("cloudreve://my") {
			return "cloudreve://my"
		}
		return s.currentPath[:lastSlash]
	}

	if path == "." {
		return s.currentPath
	}

	// Relative path - append to current
	if strings.HasSuffix(s.currentPath, "/") {
		return s.currentPath + path
	}
	return s.currentPath + "/" + path
}

func formatSize(bytes int64) string {
	const unit = 1024
	if bytes < unit {
		return fmt.Sprintf("%d B", bytes)
	}
	div, exp := int64(unit), 0
	for n := bytes / unit; n >= unit; n /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.1f %cB", float64(bytes)/float64(div), "KMGTPE"[exp])
}
