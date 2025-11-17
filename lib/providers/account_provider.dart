import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/account.dart';
import '../generated/grpc/auth_service.pbgrpc.dart';
import 'app_provider.dart';

part 'account_provider.g.dart';

/// Account Provider - 管理账户列表和当前账户
@riverpod
class AccountManager extends _$AccountManager {
  AuthServiceClient? _authClient;

  @override
  AccountState build() {
    final appState = ref.watch(appProvider);
    state = const AccountState();
    if (appState.isConnected) {
      final channel = ref.read(appProvider.notifier).channel;
      if (channel != null) {
        _authClient = AuthServiceClient(channel);
        _loadAccounts();
      }
    }
    return state;
  }

  /// 加载账户列表
  Future<void> _loadAccounts() async {
    if (_authClient == null) return;

    state = state.copyWith(isLoading: true);

    try {
      final response = await _authClient!.listAccounts(ListAccountsRequest());

      final accounts = response.accounts
          .map(
            (acc) => Account(
              id: acc.id,
              name: acc.name,
              serverUrl: acc.serverUrl,
              email: acc.email.isEmpty ? null : acc.email,
              userId: acc.userId.isEmpty ? null : acc.userId,
              isActive: acc.isActive,
              lastLoginAt: acc.hasLastLoginAt() && acc.lastLoginAt.isNotEmpty
                  ? DateTime.tryParse(acc.lastLoginAt)
                  : null,
            ),
          )
          .toList();

      // 获取当前活动账户
      var currentAccount = accounts.where((e) => e.isActive).firstOrNull;
      if (currentAccount == null && accounts.isNotEmpty) {
        currentAccount = accounts.first;
      }
      state = state.copyWith(accounts: accounts, currentAccount: currentAccount, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// 创建新账户
  Future<Account> createAccount({required String name, required String serverUrl}) async {
    if (_authClient == null) {
      throw Exception('Not connected to service');
    }

    state = state.copyWith(isLoading: true);

    try {
      final response = await _authClient!.createAccount(CreateAccountRequest(name: name, serverUrl: serverUrl));

      final account = Account(
        id: response.account.id,
        name: response.account.name,
        serverUrl: response.account.serverUrl,
        email: response.account.email.isEmpty ? null : response.account.email,
        userId: response.account.userId.isEmpty ? null : response.account.userId,
        isActive: response.account.isActive,
      );

      await _loadAccounts();

      return account;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 设置当前账户
  Future<void> setCurrentAccount(String accountId) async {
    if (_authClient == null) {
      throw Exception('Not connected to service');
    }

    state = state.copyWith(isLoading: true);

    try {
      await _authClient!.setActiveAccount(SetActiveAccountRequest(accountId: accountId));

      await _loadAccounts();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 删除账户
  Future<void> deleteAccount(String accountId) async {
    if (_authClient == null) {
      throw Exception('Not connected to service');
    }

    state = state.copyWith(isLoading: true);

    try {
      await _authClient!.deleteAccount(DeleteAccountRequest(accountId: accountId));

      await _loadAccounts();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 登录账户
  Future<void> login({String? accountId, required String username, required String password}) async {
    if (_authClient == null) {
      throw Exception('Not connected to service');
    }

    final targetAccountId = accountId ?? state.currentAccount?.id;
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    state = state.copyWith(isLoading: true);

    try {
      await _authClient!.login(LoginRequest(accountId: targetAccountId, email: username, password: password));

      await _loadAccounts();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 登出账户
  Future<void> logout({String? accountId}) async {
    if (_authClient == null) {
      throw Exception('Not connected to service');
    }

    final targetAccountId = accountId ?? state.currentAccount?.id;
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    state = state.copyWith(isLoading: true);

    try {
      await _authClient!.logout(LogoutRequest(accountId: targetAccountId));

      await _loadAccounts();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 刷新账户列表
  Future<void> refresh() => _loadAccounts();
}

/// 当前账户 Provider
@riverpod
Account? currentAccount(Ref ref) {
  return ref.watch(accountManagerProvider).currentAccount;
}

/// 当前账户 ID Provider
@riverpod
String? currentAccountId(Ref ref) {
  return ref.watch(currentAccountProvider)?.id;
}
