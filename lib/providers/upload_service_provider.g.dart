// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Upload Service Provider

@ProviderFor(UploadService)
const uploadServiceProvider = UploadServiceProvider._();

/// Upload Service Provider
final class UploadServiceProvider
    extends $NotifierProvider<UploadService, void> {
  /// Upload Service Provider
  const UploadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadServiceHash();

  @$internal
  @override
  UploadService create() => UploadService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$uploadServiceHash() => r'32e6f860c4e8193824ebbc6a9745bb9bcee5685a';

/// Upload Service Provider

abstract class _$UploadService extends $Notifier<void> {
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
