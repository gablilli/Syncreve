import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../generated/grpc/file_service.pbgrpc.dart';
import 'app_provider.dart';
import 'account_provider.dart';

part 'file_service_provider.g.dart';

/// File Service Provider
@riverpod
class FileService extends _$FileService {
  FileServiceClient? _client;

  @override
  void build() {
    final appState = ref.watch(appProvider);

    if (appState.isConnected) {
      final channel = ref.read(appProvider.notifier).channel;
      if (channel != null) {
        _client = FileServiceClient(channel);
      }
    }
  }

  /// 列出文件 (默认使用当前账户)
  Future<ListFilesResponse> listFiles({
    required String path,
    int? page,
    int? perPage,
    String? orderBy,
    bool? orderDirectionDesc,
    String? keywords,
    bool? refresh,
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    // 将最开始的 / 替换为 cloudreve://my
    if (path.startsWith('/')) {
      path = 'cloudreve://my$path';
    }

    return await _client!.listFiles(
      ListFilesRequest(
        accountId: targetAccountId,
        path: path,
        page: page,
        perPage: perPage,
        orderBy: orderBy,
        orderDirectionDesc: orderDirectionDesc,
        keywords: keywords,
        refresh: refresh,
      ),
    );
  }

  /// 获取文件信息
  Future<FileInfoResponse> getFileInfo({
    required String uri,
    bool? traceRoot,
    bool? isFolder,
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.getFileInfo(
      GetFileInfoRequest(accountId: targetAccountId, uri: uri, traceRoot: traceRoot, isFolder: isFolder),
    );
  }

  /// 创建文件/文件夹
  Future<FileInfoResponse> createFile({
    required String path,
    required String name,
    required String type, // "file" or "dir"
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.createFile(CreateFileRequest(accountId: targetAccountId, path: path, name: name, type: type));
  }

  /// 删除文件
  Future<DeleteFilesResponse> deleteFiles({
    required List<String> uris,
    bool? force,
    bool? unlink,
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.deleteFiles(
      DeleteFilesRequest(accountId: targetAccountId, uris: uris, force: force, unlink: unlink),
    );
  }

  /// 重命名文件
  Future<FileInfoResponse> renameFile({required String uri, required String newName, String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.renameFile(RenameFileRequest(accountId: targetAccountId, uri: uri, newName: newName));
  }

  /// 移动文件
  Future<MoveFilesResponse> moveFiles({
    required List<String> srcUris,
    required String dstPath,
    bool? overwrite,
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.moveFiles(
      MoveFilesRequest(accountId: targetAccountId, srcUris: srcUris, dstPath: dstPath, overwrite: overwrite),
    );
  }

  /// 获取文件 URL
  Future<FileURLResponse> getFileURL({required String uri, bool? download, String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.getFileURL(GetFileURLRequest(accountId: targetAccountId, uri: uri, download: download));
  }

  /// 获取直链
  Future<DirectLinkResponse> getDirectLink({required List<String> uris, String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.getDirectLink(GetDirectLinkRequest(accountId: targetAccountId, uris: uris));
  }
}
