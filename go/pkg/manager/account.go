package manager

import (
	"context"
	"fmt"
	"sync"
	"time"

	"github.com/google/uuid"
	"github.com/xkeyC/Syncreve/pkg/client"
	"github.com/xkeyC/Syncreve/pkg/database"
	"github.com/xkeyC/Syncreve/pkg/models"
	"gorm.io/gorm"
)

// AccountManager manages multiple Cloudreve accounts and their API clients
type AccountManager struct {
	db      *gorm.DB
	clients map[uuid.UUID]*client.Client
	mu      sync.RWMutex
}

// NewAccountManager creates a new account manager
func NewAccountManager(db *gorm.DB) *AccountManager {
	return &AccountManager{
		db:      db,
		clients: make(map[uuid.UUID]*client.Client),
	}
}

// CreateAccount creates a new account
func (am *AccountManager) CreateAccount(name, serverURL string) (*database.Account, error) {
	account := &database.Account{
		Name:      name,
		ServerURL: serverURL,
		IsActive:  false,
	}

	if err := am.db.Create(account).Error; err != nil {
		return nil, fmt.Errorf("failed to create account: %w", err)
	}

	return account, nil
}

// GetAccount retrieves an account by ID
func (am *AccountManager) GetAccount(accountID uuid.UUID) (*database.Account, error) {
	var account database.Account
	if err := am.db.First(&account, "id = ?", accountID).Error; err != nil {
		return nil, fmt.Errorf("failed to get account: %w", err)
	}
	return &account, nil
}

// ListAccounts returns all accounts
func (am *AccountManager) ListAccounts() ([]*database.Account, error) {
	var accounts []*database.Account
	if err := am.db.Find(&accounts).Error; err != nil {
		return nil, fmt.Errorf("failed to list accounts: %w", err)
	}
	return accounts, nil
}

// GetActiveAccount returns the currently active account
func (am *AccountManager) GetActiveAccount() (*database.Account, error) {
	var account database.Account
	if err := am.db.First(&account, "is_active = ?", true).Error; err != nil {
		return nil, fmt.Errorf("no active account found: %w", err)
	}
	return &account, nil
}

// SetActiveAccount sets an account as active (deactivates all others)
func (am *AccountManager) SetActiveAccount(accountID uuid.UUID) error {
	return am.db.Transaction(func(tx *gorm.DB) error {
		// Deactivate all accounts
		if err := tx.Model(&database.Account{}).Where("is_active = ?", true).Update("is_active", false).Error; err != nil {
			return fmt.Errorf("failed to deactivate accounts: %w", err)
		}

		// Activate the specified account
		if err := tx.Model(&database.Account{}).Where("id = ?", accountID).Update("is_active", true).Error; err != nil {
			return fmt.Errorf("failed to activate account: %w", err)
		}

		return nil
	})
}

// UpdateAccountTokens updates account tokens after login
func (am *AccountManager) UpdateAccountTokens(accountID uuid.UUID, accessToken, refreshToken string, expires time.Time) error {
	updates := map[string]interface{}{
		"access_token":  accessToken,
		"refresh_token": refreshToken,
		"token_expires": expires,
		"last_login_at": time.Now(),
	}

	if err := am.db.Model(&database.Account{}).Where("id = ?", accountID).Updates(updates).Error; err != nil {
		return fmt.Errorf("failed to update account tokens: %w", err)
	}

	// Invalidate cached client
	am.mu.Lock()
	delete(am.clients, accountID)
	am.mu.Unlock()

	return nil
}

// UpdateAccountUser updates account user information
func (am *AccountManager) UpdateAccountUser(accountID uuid.UUID, userID, email string) error {
	updates := map[string]interface{}{
		"user_id": userID,
		"email":   email,
	}

	if err := am.db.Model(&database.Account{}).Where("id = ?", accountID).Updates(updates).Error; err != nil {
		return fmt.Errorf("failed to update account user: %w", err)
	}

	return nil
}

// DeleteAccount deletes an account and its associated client
func (am *AccountManager) DeleteAccount(accountID uuid.UUID) error {
	// Close and remove client
	am.mu.Lock()
	if c, exists := am.clients[accountID]; exists {
		c.Close()
		delete(am.clients, accountID)
	}
	am.mu.Unlock()

	// Delete from database
	if err := am.db.Delete(&database.Account{}, "id = ?", accountID).Error; err != nil {
		return fmt.Errorf("failed to delete account: %w", err)
	}

	return nil
}

// GetClient returns or creates a client for the specified account
func (am *AccountManager) GetClient(accountID uuid.UUID) (*client.Client, error) {
	// Check cache first
	am.mu.RLock()
	if c, exists := am.clients[accountID]; exists {
		am.mu.RUnlock()
		return c, nil
	}
	am.mu.RUnlock()

	// Load account from database
	account, err := am.GetAccount(accountID)
	if err != nil {
		return nil, err
	}

	// Create new client
	am.mu.Lock()
	defer am.mu.Unlock()

	// Double-check in case another goroutine created it
	if c, exists := am.clients[accountID]; exists {
		return c, nil
	}

	// Create client with account credentials
	c, err := client.NewClient(client.Config{
		BaseURL:   account.ServerURL,
		TokenPath: "", // Don't use file-based token storage
		Debug:     false,
		EnableLog: false,
	})
	if err != nil {
		return nil, fmt.Errorf("failed to create client: %w", err)
	}

	// Set tokens if available
	if account.AccessToken != "" {
		c.SetAccessToken(account.AccessToken)
		if account.RefreshToken != "" {
			c.SetRefreshToken(account.RefreshToken)
		}
	}

	// Cache the client
	am.clients[accountID] = c

	return c, nil
}

// Login performs login for an account
func (am *AccountManager) Login(ctx context.Context, accountID uuid.UUID, email, password string) error {
	c, err := am.GetClient(accountID)
	if err != nil {
		return err
	}

	// Perform login
	loginReq := &models.PasswordLoginRequest{
		Email:    email,
		Password: password,
	}

	resp, err := c.Login(ctx, loginReq)
	if err != nil {
		return fmt.Errorf("login failed: %w", err)
	}

	// Parse token expiry
	var expires time.Time
	if resp.Token.AccessExpires != "" {
		expires, _ = time.Parse(time.RFC3339, resp.Token.AccessExpires)
	}

	// Update account tokens
	if err := am.UpdateAccountTokens(accountID, resp.Token.AccessToken, resp.Token.RefreshToken, expires); err != nil {
		return err
	}

	// Update user info if available
	if resp.User.ID != "" {
		email := ""
		if resp.User.Email != nil {
			email = *resp.User.Email
		}
		if err := am.UpdateAccountUser(accountID, resp.User.ID, email); err != nil {
			return err
		}
	}

	return nil
}

// Logout performs logout for an account
func (am *AccountManager) Logout(ctx context.Context, accountID uuid.UUID) error {
	c, err := am.GetClient(accountID)
	if err != nil {
		return err
	}

	account, err := am.GetAccount(accountID)
	if err != nil {
		return err
	}

	// Perform logout if we have a refresh token
	if account.RefreshToken != "" {
		signoutReq := &models.RefreshTokenRequest{
			RefreshToken: account.RefreshToken,
		}
		_ = c.Signout(ctx, signoutReq) // Ignore errors
	}

	// Clear tokens
	updates := map[string]interface{}{
		"access_token":  "",
		"refresh_token": "",
		"token_expires": nil,
	}

	if err := am.db.Model(&database.Account{}).Where("id = ?", accountID).Updates(updates).Error; err != nil {
		return fmt.Errorf("failed to clear account tokens: %w", err)
	}

	// Remove cached client
	am.mu.Lock()
	if c, exists := am.clients[accountID]; exists {
		c.Close()
		delete(am.clients, accountID)
	}
	am.mu.Unlock()

	return nil
}

// Close closes all clients
func (am *AccountManager) Close() error {
	am.mu.Lock()
	defer am.mu.Unlock()

	for _, c := range am.clients {
		c.Close()
	}
	am.clients = make(map[uuid.UUID]*client.Client)

	return nil
}
