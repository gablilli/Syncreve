// This is a generated file - do not edit.
//
// Generated from download_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'download_service.pb.dart' as $0;

export 'download_service.pb.dart';

/// DownloadService provides file download management
@$pb.GrpcServiceName('syncreve.DownloadService')
class DownloadServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DownloadServiceClient(super.channel, {super.options, super.interceptors});

  /// Add download task
  $grpc.ResponseFuture<$0.AddDownloadTaskResponse> addTask(
    $0.AddDownloadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addTask, request, options: options);
  }

  /// Add batch download tasks by directory
  $grpc.ResponseFuture<$0.AddDownloadTaskResponse> addTasksByDir(
    $0.AddDownloadTasksByDirRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addTasksByDir, request, options: options);
  }

  /// Cancel download task
  $grpc.ResponseFuture<$0.CancelTaskResponse> cancelTask(
    $0.CancelTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cancelTask, request, options: options);
  }

  /// Get download task info
  $grpc.ResponseFuture<$0.TaskInfoResponse> getTaskInfo(
    $0.GetTaskInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTaskInfo, request, options: options);
  }

  /// List download tasks
  $grpc.ResponseFuture<$0.ListTasksResponse> listTasks(
    $0.ListTasksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTasks, request, options: options);
  }

  /// Get task status stream
  $grpc.ResponseStream<$0.TaskStatusUpdate> watchTaskStatus(
    $0.WatchTaskStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$watchTaskStatus, $async.Stream.fromIterable([request]),
        options: options);
  }

  /// Pause download task
  $grpc.ResponseFuture<$0.PauseTaskResponse> pauseTask(
    $0.PauseTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pauseTask, request, options: options);
  }

  /// Resume download task
  $grpc.ResponseFuture<$0.ResumeTaskResponse> resumeTask(
    $0.ResumeTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resumeTask, request, options: options);
  }

  /// Retry failed task
  $grpc.ResponseFuture<$0.RetryTaskResponse> retryTask(
    $0.RetryTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$retryTask, request, options: options);
  }

  /// Clear completed tasks
  $grpc.ResponseFuture<$0.ClearCompletedResponse> clearCompleted(
    $0.ClearCompletedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clearCompleted, request, options: options);
  }

  /// Get download statistics
  $grpc.ResponseFuture<$0.StatsResponse> getStats(
    $0.GetStatsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getStats, request, options: options);
  }

  // method descriptors

  static final _$addTask =
      $grpc.ClientMethod<$0.AddDownloadTaskRequest, $0.AddDownloadTaskResponse>(
          '/syncreve.DownloadService/AddTask',
          ($0.AddDownloadTaskRequest value) => value.writeToBuffer(),
          $0.AddDownloadTaskResponse.fromBuffer);
  static final _$addTasksByDir = $grpc.ClientMethod<
          $0.AddDownloadTasksByDirRequest, $0.AddDownloadTaskResponse>(
      '/syncreve.DownloadService/AddTasksByDir',
      ($0.AddDownloadTasksByDirRequest value) => value.writeToBuffer(),
      $0.AddDownloadTaskResponse.fromBuffer);
  static final _$cancelTask =
      $grpc.ClientMethod<$0.CancelTaskRequest, $0.CancelTaskResponse>(
          '/syncreve.DownloadService/CancelTask',
          ($0.CancelTaskRequest value) => value.writeToBuffer(),
          $0.CancelTaskResponse.fromBuffer);
  static final _$getTaskInfo =
      $grpc.ClientMethod<$0.GetTaskInfoRequest, $0.TaskInfoResponse>(
          '/syncreve.DownloadService/GetTaskInfo',
          ($0.GetTaskInfoRequest value) => value.writeToBuffer(),
          $0.TaskInfoResponse.fromBuffer);
  static final _$listTasks =
      $grpc.ClientMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
          '/syncreve.DownloadService/ListTasks',
          ($0.ListTasksRequest value) => value.writeToBuffer(),
          $0.ListTasksResponse.fromBuffer);
  static final _$watchTaskStatus =
      $grpc.ClientMethod<$0.WatchTaskStatusRequest, $0.TaskStatusUpdate>(
          '/syncreve.DownloadService/WatchTaskStatus',
          ($0.WatchTaskStatusRequest value) => value.writeToBuffer(),
          $0.TaskStatusUpdate.fromBuffer);
  static final _$pauseTask =
      $grpc.ClientMethod<$0.PauseTaskRequest, $0.PauseTaskResponse>(
          '/syncreve.DownloadService/PauseTask',
          ($0.PauseTaskRequest value) => value.writeToBuffer(),
          $0.PauseTaskResponse.fromBuffer);
  static final _$resumeTask =
      $grpc.ClientMethod<$0.ResumeTaskRequest, $0.ResumeTaskResponse>(
          '/syncreve.DownloadService/ResumeTask',
          ($0.ResumeTaskRequest value) => value.writeToBuffer(),
          $0.ResumeTaskResponse.fromBuffer);
  static final _$retryTask =
      $grpc.ClientMethod<$0.RetryTaskRequest, $0.RetryTaskResponse>(
          '/syncreve.DownloadService/RetryTask',
          ($0.RetryTaskRequest value) => value.writeToBuffer(),
          $0.RetryTaskResponse.fromBuffer);
  static final _$clearCompleted =
      $grpc.ClientMethod<$0.ClearCompletedRequest, $0.ClearCompletedResponse>(
          '/syncreve.DownloadService/ClearCompleted',
          ($0.ClearCompletedRequest value) => value.writeToBuffer(),
          $0.ClearCompletedResponse.fromBuffer);
  static final _$getStats =
      $grpc.ClientMethod<$0.GetStatsRequest, $0.StatsResponse>(
          '/syncreve.DownloadService/GetStats',
          ($0.GetStatsRequest value) => value.writeToBuffer(),
          $0.StatsResponse.fromBuffer);
}

@$pb.GrpcServiceName('syncreve.DownloadService')
abstract class DownloadServiceBase extends $grpc.Service {
  $core.String get $name => 'syncreve.DownloadService';

  DownloadServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddDownloadTaskRequest,
            $0.AddDownloadTaskResponse>(
        'AddTask',
        addTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddDownloadTaskRequest.fromBuffer(value),
        ($0.AddDownloadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddDownloadTasksByDirRequest,
            $0.AddDownloadTaskResponse>(
        'AddTasksByDir',
        addTasksByDir_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddDownloadTasksByDirRequest.fromBuffer(value),
        ($0.AddDownloadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CancelTaskRequest, $0.CancelTaskResponse>(
        'CancelTask',
        cancelTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CancelTaskRequest.fromBuffer(value),
        ($0.CancelTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTaskInfoRequest, $0.TaskInfoResponse>(
        'GetTaskInfo',
        getTaskInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTaskInfoRequest.fromBuffer(value),
        ($0.TaskInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
        'ListTasks',
        listTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTasksRequest.fromBuffer(value),
        ($0.ListTasksResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.WatchTaskStatusRequest, $0.TaskStatusUpdate>(
            'WatchTaskStatus',
            watchTaskStatus_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.WatchTaskStatusRequest.fromBuffer(value),
            ($0.TaskStatusUpdate value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PauseTaskRequest, $0.PauseTaskResponse>(
        'PauseTask',
        pauseTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PauseTaskRequest.fromBuffer(value),
        ($0.PauseTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResumeTaskRequest, $0.ResumeTaskResponse>(
        'ResumeTask',
        resumeTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ResumeTaskRequest.fromBuffer(value),
        ($0.ResumeTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetryTaskRequest, $0.RetryTaskResponse>(
        'RetryTask',
        retryTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RetryTaskRequest.fromBuffer(value),
        ($0.RetryTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClearCompletedRequest,
            $0.ClearCompletedResponse>(
        'ClearCompleted',
        clearCompleted_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ClearCompletedRequest.fromBuffer(value),
        ($0.ClearCompletedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStatsRequest, $0.StatsResponse>(
        'GetStats',
        getStats_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStatsRequest.fromBuffer(value),
        ($0.StatsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddDownloadTaskResponse> addTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddDownloadTaskRequest> $request) async {
    return addTask($call, await $request);
  }

  $async.Future<$0.AddDownloadTaskResponse> addTask(
      $grpc.ServiceCall call, $0.AddDownloadTaskRequest request);

  $async.Future<$0.AddDownloadTaskResponse> addTasksByDir_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AddDownloadTasksByDirRequest> $request) async {
    return addTasksByDir($call, await $request);
  }

  $async.Future<$0.AddDownloadTaskResponse> addTasksByDir(
      $grpc.ServiceCall call, $0.AddDownloadTasksByDirRequest request);

  $async.Future<$0.CancelTaskResponse> cancelTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CancelTaskRequest> $request) async {
    return cancelTask($call, await $request);
  }

  $async.Future<$0.CancelTaskResponse> cancelTask(
      $grpc.ServiceCall call, $0.CancelTaskRequest request);

  $async.Future<$0.TaskInfoResponse> getTaskInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetTaskInfoRequest> $request) async {
    return getTaskInfo($call, await $request);
  }

  $async.Future<$0.TaskInfoResponse> getTaskInfo(
      $grpc.ServiceCall call, $0.GetTaskInfoRequest request);

  $async.Future<$0.ListTasksResponse> listTasks_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListTasksRequest> $request) async {
    return listTasks($call, await $request);
  }

  $async.Future<$0.ListTasksResponse> listTasks(
      $grpc.ServiceCall call, $0.ListTasksRequest request);

  $async.Stream<$0.TaskStatusUpdate> watchTaskStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.WatchTaskStatusRequest> $request) async* {
    yield* watchTaskStatus($call, await $request);
  }

  $async.Stream<$0.TaskStatusUpdate> watchTaskStatus(
      $grpc.ServiceCall call, $0.WatchTaskStatusRequest request);

  $async.Future<$0.PauseTaskResponse> pauseTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.PauseTaskRequest> $request) async {
    return pauseTask($call, await $request);
  }

  $async.Future<$0.PauseTaskResponse> pauseTask(
      $grpc.ServiceCall call, $0.PauseTaskRequest request);

  $async.Future<$0.ResumeTaskResponse> resumeTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ResumeTaskRequest> $request) async {
    return resumeTask($call, await $request);
  }

  $async.Future<$0.ResumeTaskResponse> resumeTask(
      $grpc.ServiceCall call, $0.ResumeTaskRequest request);

  $async.Future<$0.RetryTaskResponse> retryTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RetryTaskRequest> $request) async {
    return retryTask($call, await $request);
  }

  $async.Future<$0.RetryTaskResponse> retryTask(
      $grpc.ServiceCall call, $0.RetryTaskRequest request);

  $async.Future<$0.ClearCompletedResponse> clearCompleted_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ClearCompletedRequest> $request) async {
    return clearCompleted($call, await $request);
  }

  $async.Future<$0.ClearCompletedResponse> clearCompleted(
      $grpc.ServiceCall call, $0.ClearCompletedRequest request);

  $async.Future<$0.StatsResponse> getStats_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetStatsRequest> $request) async {
    return getStats($call, await $request);
  }

  $async.Future<$0.StatsResponse> getStats(
      $grpc.ServiceCall call, $0.GetStatsRequest request);
}
