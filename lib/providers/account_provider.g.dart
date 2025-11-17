// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Account Provider - 管理账户列表和当前账户

@ProviderFor(AccountManager)
const accountManagerProvider = AccountManagerProvider._();

/// Account Provider - 管理账户列表和当前账户
final class AccountManagerProvider
    extends $NotifierProvider<AccountManager, AccountState> {
  /// Account Provider - 管理账户列表和当前账户
  const AccountManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountManagerHash();

  @$internal
  @override
  AccountManager create() => AccountManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountState>(value),
    );
  }
}

String _$accountManagerHash() => r'fb2672109db2914e0122b89ff60cee2006cf2fe7';

/// Account Provider - 管理账户列表和当前账户

abstract class _$AccountManager extends $Notifier<AccountState> {
  AccountState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AccountState, AccountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountState, AccountState>,
              AccountState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 当前账户 Provider

@ProviderFor(currentAccount)
const currentAccountProvider = CurrentAccountProvider._();

/// 当前账户 Provider

final class CurrentAccountProvider
    extends $FunctionalProvider<Account?, Account?, Account?>
    with $Provider<Account?> {
  /// 当前账户 Provider
  const CurrentAccountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentAccountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentAccountHash();

  @$internal
  @override
  $ProviderElement<Account?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Account? create(Ref ref) {
    return currentAccount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Account? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Account?>(value),
    );
  }
}

String _$currentAccountHash() => r'e663a4abb63d58d185609c4b62e005805657dabc';

/// 当前账户 ID Provider

@ProviderFor(currentAccountId)
const currentAccountIdProvider = CurrentAccountIdProvider._();

/// 当前账户 ID Provider

final class CurrentAccountIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// 当前账户 ID Provider
  const CurrentAccountIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentAccountIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentAccountIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentAccountId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentAccountIdHash() => r'dff3d46c20ba6045c0d9eeb2fea30f987b1a3e3f';
