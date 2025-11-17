package grpcserver

import (
	"context"

	"github.com/google/uuid"
	"github.com/xkeyC/Syncreve/pkg/database"
	pb "github.com/xkeyC/Syncreve/pkg/grpc/protos"
	"github.com/xkeyC/Syncreve/pkg/manager"
	"github.com/xkeyC/Syncreve/pkg/models"
)

type authService struct {
	pb.UnimplementedAuthServiceServer
	accountMgr *manager.AccountManager
}

// CreateAccount creates a new account
func (s *authService) CreateAccount(ctx context.Context, req *pb.CreateAccountRequest) (*pb.CreateAccountResponse, error) {
	account, err := s.accountMgr.CreateAccount(req.Name, req.ServerUrl)
	if err != nil {
		errMsg := err.Error()
		return &pb.CreateAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.CreateAccountResponse{
		Success: true,
		Account: convertAccountToProto(account),
	}, nil
}

// ListAccounts lists all accounts
func (s *authService) ListAccounts(ctx context.Context, req *pb.ListAccountsRequest) (*pb.ListAccountsResponse, error) {
	accounts, err := s.accountMgr.ListAccounts()
	if err != nil {
		return &pb.ListAccountsResponse{
			Accounts: []*pb.AccountInfo{},
		}, err
	}

	protoAccounts := make([]*pb.AccountInfo, len(accounts))
	for i, acc := range accounts {
		protoAccounts[i] = convertAccountToProto(acc)
	}

	return &pb.ListAccountsResponse{
		Accounts: protoAccounts,
	}, nil
}

// GetAccount gets an account by ID
func (s *authService) GetAccount(ctx context.Context, req *pb.GetAccountRequest) (*pb.GetAccountResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		errMsg := "invalid account ID"
		return &pb.GetAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	account, err := s.accountMgr.GetAccount(accountID)
	if err != nil {
		errMsg := err.Error()
		return &pb.GetAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.GetAccountResponse{
		Success: true,
		Account: convertAccountToProto(account),
	}, nil
}

// DeleteAccount deletes an account
func (s *authService) DeleteAccount(ctx context.Context, req *pb.DeleteAccountRequest) (*pb.DeleteAccountResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		errMsg := "invalid account ID"
		return &pb.DeleteAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	if err := s.accountMgr.DeleteAccount(accountID); err != nil {
		errMsg := err.Error()
		return &pb.DeleteAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.DeleteAccountResponse{
		Success: true,
	}, nil
}

// SetActiveAccount sets an account as active
func (s *authService) SetActiveAccount(ctx context.Context, req *pb.SetActiveAccountRequest) (*pb.SetActiveAccountResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		errMsg := "invalid account ID"
		return &pb.SetActiveAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	if err := s.accountMgr.SetActiveAccount(accountID); err != nil {
		errMsg := err.Error()
		return &pb.SetActiveAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.SetActiveAccountResponse{
		Success: true,
	}, nil
}

// GetActiveAccount gets the currently active account
func (s *authService) GetActiveAccount(ctx context.Context, req *pb.GetActiveAccountRequest) (*pb.GetActiveAccountResponse, error) {
	account, err := s.accountMgr.GetActiveAccount()
	if err != nil {
		errMsg := err.Error()
		return &pb.GetActiveAccountResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	return &pb.GetActiveAccountResponse{
		Success: true,
		Account: convertAccountToProto(account),
	}, nil
}

// Login performs password-based login
func (s *authService) Login(ctx context.Context, req *pb.LoginRequest) (*pb.LoginResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		errMsg := "invalid account ID"
		return &pb.LoginResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	// Perform login
	if err := s.accountMgr.Login(ctx, accountID, req.Email, req.Password); err != nil {
		errMsg := err.Error()
		return &pb.LoginResponse{
			Success: false,
			Error:   &errMsg,
		}, nil
	}

	// Get user info from client
	client, err := s.accountMgr.GetClient(accountID)
	if err != nil {
		return &pb.LoginResponse{
			Success: true, // Login succeeded even if we can't get user info
		}, nil
	}

	user, err := client.GetUserMe(ctx)
	if err != nil {
		return &pb.LoginResponse{
			Success: true, // Login succeeded even if we can't get user info
		}, nil
	}

	return &pb.LoginResponse{
		Success: true,
		User:    convertUserToProto(user),
	}, nil
}

// Login2FA performs 2FA login (not fully implemented yet)
func (s *authService) Login2FA(ctx context.Context, req *pb.Login2FARequest) (*pb.LoginResponse, error) {
	errMsg := "2FA login not implemented yet"
	return &pb.LoginResponse{
		Success: false,
		Error:   &errMsg,
	}, nil
}

// Logout performs logout
func (s *authService) Logout(ctx context.Context, req *pb.LogoutRequest) (*pb.LogoutResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return &pb.LogoutResponse{
			Success: false,
		}, nil
	}

	if err := s.accountMgr.Logout(ctx, accountID); err != nil {
		return &pb.LogoutResponse{
			Success: false,
		}, nil
	}

	return &pb.LogoutResponse{
		Success: true,
	}, nil
}

// GetUserInfo gets current user info
func (s *authService) GetUserInfo(ctx context.Context, req *pb.GetUserInfoRequest) (*pb.UserInfoResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, err
	}

	client, err := s.accountMgr.GetClient(accountID)
	if err != nil {
		return nil, err
	}

	user, err := client.GetUserMe(ctx)
	if err != nil {
		return nil, err
	}

	return &pb.UserInfoResponse{
		User: convertUserToProto(user),
	}, nil
}

// IsAuthenticated checks if account is authenticated
func (s *authService) IsAuthenticated(ctx context.Context, req *pb.IsAuthenticatedRequest) (*pb.IsAuthenticatedResponse, error) {
	accountID, err := uuid.Parse(req.AccountId)
	if err != nil {
		return &pb.IsAuthenticatedResponse{
			Authenticated: false,
		}, nil
	}

	account, err := s.accountMgr.GetAccount(accountID)
	if err != nil {
		return &pb.IsAuthenticatedResponse{
			Authenticated: false,
		}, nil
	}

	// Check if account has valid tokens
	authenticated := account.AccessToken != ""

	return &pb.IsAuthenticatedResponse{
		Authenticated: authenticated,
	}, nil
}

// Helper functions

func convertAccountToProto(acc *database.Account) *pb.AccountInfo {
	info := &pb.AccountInfo{
		Id:              acc.ID.String(),
		Name:            acc.Name,
		ServerUrl:       acc.ServerURL,
		IsActive:        acc.IsActive,
		IsAuthenticated: acc.AccessToken != "",
	}

	if acc.Email != "" {
		info.Email = &acc.Email
	}
	if acc.UserID != "" {
		info.UserId = &acc.UserID
	}
	if acc.LastLoginAt != nil {
		timeStr := acc.LastLoginAt.Format("2006-01-02T15:04:05Z07:00")
		info.LastLoginAt = &timeStr
	}

	return info
}

func convertUserToProto(user *models.User) *pb.UserInfo {
	info := &pb.UserInfo{
		Id:       user.ID,
		Username: user.Nickname,
		Nickname: user.Nickname,
	}

	if user.Email != nil {
		info.Email = *user.Email
	}
	if user.Avatar != nil {
		info.Avatar = *user.Avatar
	}
	if user.Group != nil {
		// Parse group ID
		info.GroupId = 0 // default
	}

	return info
}
