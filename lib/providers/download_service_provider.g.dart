// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Download Service Provider

@ProviderFor(DownloadService)
const downloadServiceProvider = DownloadServiceProvider._();

/// Download Service Provider
final class DownloadServiceProvider
    extends $NotifierProvider<DownloadService, void> {
  /// Download Service Provider
  const DownloadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadServiceHash();

  @$internal
  @override
  DownloadService create() => DownloadService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadServiceHash() => r'd8ff5b07bd3f6689550d2be471c430d63c70b553';

/// Download Service Provider

abstract class _$DownloadService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
