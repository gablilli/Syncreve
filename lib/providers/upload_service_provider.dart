import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../generated/grpc/upload_service.pbgrpc.dart';
import 'app_provider.dart';
import 'account_provider.dart';

part 'upload_service_provider.g.dart';

/// Upload Service Provider
@riverpod
class UploadService extends _$UploadService {
  UploadServiceClient? _client;

  @override
  void build() {
    final appState = ref.watch(appProvider);

    if (appState.isConnected) {
      final channel = ref.read(appProvider.notifier).channel;
      if (channel != null) {
        _client = UploadServiceClient(channel);
      }
    }
  }

  /// 添加上传任务
  Future<AddUploadTaskResponse> addUploadTask({
    required String localPath,
    required String remotePath,
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

    return await _client!.addTask(
      AddUploadTaskRequest(
        accountId: targetAccountId,
        localPath: localPath,
        remotePath: remotePath,
        overwrite: overwrite,
      ),
    );
  }

  /// 获取任务列表
  Future<ListUploadTasksResponse> getUploadTasks({
    UploadTaskStatus? status,
    int? page,
    int? perPage,
    String? accountId,
  }) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.listTasks(
      ListUploadTasksRequest(accountId: targetAccountId, status: status, page: page, perPage: perPage),
    );
  }

  /// 暂停任务
  Future<PauseUploadTaskResponse> pauseUploadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.pauseTask(PauseUploadTaskRequest(taskId: taskId));
  }

  /// 恢复任务
  Future<ResumeUploadTaskResponse> resumeUploadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.resumeTask(ResumeUploadTaskRequest(taskId: taskId));
  }

  /// 取消任务
  Future<CancelUploadTaskResponse> cancelUploadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.cancelTask(CancelUploadTaskRequest(taskId: taskId));
  }

  /// 获取任务信息
  Future<UploadTaskInfoResponse> getTaskInfo({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.getTaskInfo(GetUploadTaskInfoRequest(taskId: taskId));
  }

  /// 重试失败的任务
  Future<RetryUploadTaskResponse> retryTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.retryTask(RetryUploadTaskRequest(taskId: taskId));
  }

  /// 清除已完成的任务
  Future<ClearUploadCompletedResponse> clearCompleted({String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.clearCompleted(ClearUploadCompletedRequest(accountId: targetAccountId));
  }

  /// 获取统计信息
  Future<UploadStatsResponse> getStats({String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.getStats(GetUploadStatsRequest(accountId: targetAccountId));
  }
}
