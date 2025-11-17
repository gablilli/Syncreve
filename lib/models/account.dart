import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// 账户信息
@freezed
sealed class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    required String serverUrl,
    String? email,
    String? userId,
    @Default(false) bool isActive,
    DateTime? lastLoginAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

/// 账户状态 - 管理账户列表和当前账户
@freezed
sealed class AccountState with _$AccountState {
  const factory AccountState({
    @Default([]) List<Account> accounts,
    Account? currentAccount,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AccountState;

  const AccountState._();

  bool get hasAccounts => accounts.isNotEmpty;
  bool get hasCurrentAccount => currentAccount != null;
}
