import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../generated/grpc/download_service.pbgrpc.dart';
import 'app_provider.dart';
import 'account_provider.dart';

part 'download_service_provider.g.dart';

/// Download Service Provider
@riverpod
class DownloadService extends _$DownloadService {
  DownloadServiceClient? _client;

  @override
  void build() {
    final appState = ref.watch(appProvider);

    if (appState.isConnected) {
      final channel = ref.read(appProvider.notifier).channel;
      if (channel != null) {
        _client = DownloadServiceClient(channel);
      }
    }
  }

  /// 添加下载任务
  Future<AddDownloadTaskResponse> addDownloadTask({
    required String fileId,
    required String fileName,
    String? uri,
    required String savePath,
    TaskType type = TaskType.NORMAL,
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
      AddDownloadTaskRequest(
        accountId: targetAccountId,
        files: [FileToDownload(fileId: fileId, fileName: fileName, uri: uri)],
        savePath: savePath,
        type: type,
      ),
    );
  }

  /// 获取任务列表
  Future<ListTasksResponse> getDownloadTasks({
    TaskStatus? status,
    TaskType? type,
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
      ListTasksRequest(accountId: targetAccountId, status: status, type: type, page: page, perPage: perPage),
    );
  }

  /// 暂停任务
  Future<PauseTaskResponse> pauseDownloadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.pauseTask(PauseTaskRequest(taskId: taskId));
  }

  /// 恢复任务
  Future<ResumeTaskResponse> resumeDownloadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.resumeTask(ResumeTaskRequest(taskId: taskId));
  }

  /// 取消任务
  Future<CancelTaskResponse> cancelDownloadTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.cancelTask(CancelTaskRequest(taskId: taskId));
  }

  /// 获取任务信息
  Future<TaskInfoResponse> getTaskInfo({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.getTaskInfo(GetTaskInfoRequest(taskId: taskId));
  }

  /// 重试失败的任务
  Future<RetryTaskResponse> retryTask({required String taskId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    return await _client!.retryTask(RetryTaskRequest(taskId: taskId));
  }

  /// 清除已完成的任务
  Future<ClearCompletedResponse> clearCompleted({String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.clearCompleted(ClearCompletedRequest(accountId: targetAccountId));
  }

  /// 获取统计信息
  Future<StatsResponse> getStats({String? accountId}) async {
    if (_client == null) {
      throw Exception('Service not connected');
    }

    final targetAccountId = accountId ?? ref.read(currentAccountIdProvider);
    if (targetAccountId == null) {
      throw Exception('No account selected');
    }

    return await _client!.getStats(GetStatsRequest(accountId: targetAccountId));
  }
}
