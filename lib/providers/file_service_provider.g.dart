// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// File Service Provider

@ProviderFor(FileService)
const fileServiceProvider = FileServiceProvider._();

/// File Service Provider
final class FileServiceProvider extends $NotifierProvider<FileService, void> {
  /// File Service Provider
  const FileServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileServiceHash();

  @$internal
  @override
  FileService create() => FileService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$fileServiceHash() => r'4aa04fbcd484ab27813ef22644d669e0e2fb81b9';

/// File Service Provider

abstract class _$FileService extends $Notifier<void> {
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
