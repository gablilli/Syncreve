// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App Provider - 管理 gRPC 连接状态

@ProviderFor(App)
const appProvider = AppProvider._();

/// App Provider - 管理 gRPC 连接状态
final class AppProvider extends $NotifierProvider<App, AppState> {
  /// App Provider - 管理 gRPC 连接状态
  const AppProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appHash();

  @$internal
  @override
  App create() => App();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppState>(value),
    );
  }
}

String _$appHash() => r'6695df97485c4699893c9d09727fc3cd282d965a';

/// App Provider - 管理 gRPC 连接状态

abstract class _$App extends $Notifier<AppState> {
  AppState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppState, AppState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppState, AppState>,
              AppState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
