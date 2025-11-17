// This is a generated file - do not edit.
//
// Generated from upload_service.proto.

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

import 'upload_service.pb.dart' as $0;

export 'upload_service.pb.dart';

/// UploadService provides file upload management
@$pb.GrpcServiceName('syncreve.UploadService')
class UploadServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UploadServiceClient(super.channel, {super.options, super.interceptors});

  /// Add upload task
  $grpc.ResponseFuture<$0.AddUploadTaskResponse> addTask(
    $0.AddUploadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addTask, request, options: options);
  }

  /// Add batch upload tasks
  $grpc.ResponseFuture<$0.AddUploadTaskResponse> addBatchTasks(
    $0.AddBatchUploadTasksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addBatchTasks, request, options: options);
  }

  /// Cancel upload task
  $grpc.ResponseFuture<$0.CancelUploadTaskResponse> cancelTask(
    $0.CancelUploadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cancelTask, request, options: options);
  }

  /// Get upload task info
  $grpc.ResponseFuture<$0.UploadTaskInfoResponse> getTaskInfo(
    $0.GetUploadTaskInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTaskInfo, request, options: options);
  }

  /// List upload tasks
  $grpc.ResponseFuture<$0.ListUploadTasksResponse> listTasks(
    $0.ListUploadTasksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTasks, request, options: options);
  }

  /// Get task status stream
  $grpc.ResponseStream<$0.UploadTaskStatusUpdate> watchTaskStatus(
    $0.WatchUploadTaskStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$watchTaskStatus, $async.Stream.fromIterable([request]),
        options: options);
  }

  /// Pause upload task
  $grpc.ResponseFuture<$0.PauseUploadTaskResponse> pauseTask(
    $0.PauseUploadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pauseTask, request, options: options);
  }

  /// Resume upload task
  $grpc.ResponseFuture<$0.ResumeUploadTaskResponse> resumeTask(
    $0.ResumeUploadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resumeTask, request, options: options);
  }

  /// Retry failed task
  $grpc.ResponseFuture<$0.RetryUploadTaskResponse> retryTask(
    $0.RetryUploadTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$retryTask, request, options: options);
  }

  /// Clear completed tasks
  $grpc.ResponseFuture<$0.ClearUploadCompletedResponse> clearCompleted(
    $0.ClearUploadCompletedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clearCompleted, request, options: options);
  }

  /// Get upload statistics
  $grpc.ResponseFuture<$0.UploadStatsResponse> getStats(
    $0.GetUploadStatsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getStats, request, options: options);
  }

  // method descriptors

  static final _$addTask =
      $grpc.ClientMethod<$0.AddUploadTaskRequest, $0.AddUploadTaskResponse>(
          '/syncreve.UploadService/AddTask',
          ($0.AddUploadTaskRequest value) => value.writeToBuffer(),
          $0.AddUploadTaskResponse.fromBuffer);
  static final _$addBatchTasks = $grpc.ClientMethod<
          $0.AddBatchUploadTasksRequest, $0.AddUploadTaskResponse>(
      '/syncreve.UploadService/AddBatchTasks',
      ($0.AddBatchUploadTasksRequest value) => value.writeToBuffer(),
      $0.AddUploadTaskResponse.fromBuffer);
  static final _$cancelTask = $grpc.ClientMethod<$0.CancelUploadTaskRequest,
          $0.CancelUploadTaskResponse>(
      '/syncreve.UploadService/CancelTask',
      ($0.CancelUploadTaskRequest value) => value.writeToBuffer(),
      $0.CancelUploadTaskResponse.fromBuffer);
  static final _$getTaskInfo = $grpc.ClientMethod<$0.GetUploadTaskInfoRequest,
          $0.UploadTaskInfoResponse>(
      '/syncreve.UploadService/GetTaskInfo',
      ($0.GetUploadTaskInfoRequest value) => value.writeToBuffer(),
      $0.UploadTaskInfoResponse.fromBuffer);
  static final _$listTasks =
      $grpc.ClientMethod<$0.ListUploadTasksRequest, $0.ListUploadTasksResponse>(
          '/syncreve.UploadService/ListTasks',
          ($0.ListUploadTasksRequest value) => value.writeToBuffer(),
          $0.ListUploadTasksResponse.fromBuffer);
  static final _$watchTaskStatus = $grpc.ClientMethod<
          $0.WatchUploadTaskStatusRequest, $0.UploadTaskStatusUpdate>(
      '/syncreve.UploadService/WatchTaskStatus',
      ($0.WatchUploadTaskStatusRequest value) => value.writeToBuffer(),
      $0.UploadTaskStatusUpdate.fromBuffer);
  static final _$pauseTask =
      $grpc.ClientMethod<$0.PauseUploadTaskRequest, $0.PauseUploadTaskResponse>(
          '/syncreve.UploadService/PauseTask',
          ($0.PauseUploadTaskRequest value) => value.writeToBuffer(),
          $0.PauseUploadTaskResponse.fromBuffer);
  static final _$resumeTask = $grpc.ClientMethod<$0.ResumeUploadTaskRequest,
          $0.ResumeUploadTaskResponse>(
      '/syncreve.UploadService/ResumeTask',
      ($0.ResumeUploadTaskRequest value) => value.writeToBuffer(),
      $0.ResumeUploadTaskResponse.fromBuffer);
  static final _$retryTask =
      $grpc.ClientMethod<$0.RetryUploadTaskRequest, $0.RetryUploadTaskResponse>(
          '/syncreve.UploadService/RetryTask',
          ($0.RetryUploadTaskRequest value) => value.writeToBuffer(),
          $0.RetryUploadTaskResponse.fromBuffer);
  static final _$clearCompleted = $grpc.ClientMethod<
          $0.ClearUploadCompletedRequest, $0.ClearUploadCompletedResponse>(
      '/syncreve.UploadService/ClearCompleted',
      ($0.ClearUploadCompletedRequest value) => value.writeToBuffer(),
      $0.ClearUploadCompletedResponse.fromBuffer);
  static final _$getStats =
      $grpc.ClientMethod<$0.GetUploadStatsRequest, $0.UploadStatsResponse>(
          '/syncreve.UploadService/GetStats',
          ($0.GetUploadStatsRequest value) => value.writeToBuffer(),
          $0.UploadStatsResponse.fromBuffer);
}

@$pb.GrpcServiceName('syncreve.UploadService')
abstract class UploadServiceBase extends $grpc.Service {
  $core.String get $name => 'syncreve.UploadService';

  UploadServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.AddUploadTaskRequest, $0.AddUploadTaskResponse>(
            'AddTask',
            addTask_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddUploadTaskRequest.fromBuffer(value),
            ($0.AddUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddBatchUploadTasksRequest,
            $0.AddUploadTaskResponse>(
        'AddBatchTasks',
        addBatchTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddBatchUploadTasksRequest.fromBuffer(value),
        ($0.AddUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CancelUploadTaskRequest,
            $0.CancelUploadTaskResponse>(
        'CancelTask',
        cancelTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CancelUploadTaskRequest.fromBuffer(value),
        ($0.CancelUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUploadTaskInfoRequest,
            $0.UploadTaskInfoResponse>(
        'GetTaskInfo',
        getTaskInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUploadTaskInfoRequest.fromBuffer(value),
        ($0.UploadTaskInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUploadTasksRequest,
            $0.ListUploadTasksResponse>(
        'ListTasks',
        listTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListUploadTasksRequest.fromBuffer(value),
        ($0.ListUploadTasksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WatchUploadTaskStatusRequest,
            $0.UploadTaskStatusUpdate>(
        'WatchTaskStatus',
        watchTaskStatus_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.WatchUploadTaskStatusRequest.fromBuffer(value),
        ($0.UploadTaskStatusUpdate value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PauseUploadTaskRequest,
            $0.PauseUploadTaskResponse>(
        'PauseTask',
        pauseTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PauseUploadTaskRequest.fromBuffer(value),
        ($0.PauseUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResumeUploadTaskRequest,
            $0.ResumeUploadTaskResponse>(
        'ResumeTask',
        resumeTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResumeUploadTaskRequest.fromBuffer(value),
        ($0.ResumeUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetryUploadTaskRequest,
            $0.RetryUploadTaskResponse>(
        'RetryTask',
        retryTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RetryUploadTaskRequest.fromBuffer(value),
        ($0.RetryUploadTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClearUploadCompletedRequest,
            $0.ClearUploadCompletedResponse>(
        'ClearCompleted',
        clearCompleted_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ClearUploadCompletedRequest.fromBuffer(value),
        ($0.ClearUploadCompletedResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetUploadStatsRequest, $0.UploadStatsResponse>(
            'GetStats',
            getStats_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUploadStatsRequest.fromBuffer(value),
            ($0.UploadStatsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddUploadTaskResponse> addTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddUploadTaskRequest> $request) async {
    return addTask($call, await $request);
  }

  $async.Future<$0.AddUploadTaskResponse> addTask(
      $grpc.ServiceCall call, $0.AddUploadTaskRequest request);

  $async.Future<$0.AddUploadTaskResponse> addBatchTasks_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AddBatchUploadTasksRequest> $request) async {
    return addBatchTasks($call, await $request);
  }

  $async.Future<$0.AddUploadTaskResponse> addBatchTasks(
      $grpc.ServiceCall call, $0.AddBatchUploadTasksRequest request);

  $async.Future<$0.CancelUploadTaskResponse> cancelTask_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CancelUploadTaskRequest> $request) async {
    return cancelTask($call, await $request);
  }

  $async.Future<$0.CancelUploadTaskResponse> cancelTask(
      $grpc.ServiceCall call, $0.CancelUploadTaskRequest request);

  $async.Future<$0.UploadTaskInfoResponse> getTaskInfo_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUploadTaskInfoRequest> $request) async {
    return getTaskInfo($call, await $request);
  }

  $async.Future<$0.UploadTaskInfoResponse> getTaskInfo(
      $grpc.ServiceCall call, $0.GetUploadTaskInfoRequest request);

  $async.Future<$0.ListUploadTasksResponse> listTasks_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListUploadTasksRequest> $request) async {
    return listTasks($call, await $request);
  }

  $async.Future<$0.ListUploadTasksResponse> listTasks(
      $grpc.ServiceCall call, $0.ListUploadTasksRequest request);

  $async.Stream<$0.UploadTaskStatusUpdate> watchTaskStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.WatchUploadTaskStatusRequest> $request) async* {
    yield* watchTaskStatus($call, await $request);
  }

  $async.Stream<$0.UploadTaskStatusUpdate> watchTaskStatus(
      $grpc.ServiceCall call, $0.WatchUploadTaskStatusRequest request);

  $async.Future<$0.PauseUploadTaskResponse> pauseTask_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.PauseUploadTaskRequest> $request) async {
    return pauseTask($call, await $request);
  }

  $async.Future<$0.PauseUploadTaskResponse> pauseTask(
      $grpc.ServiceCall call, $0.PauseUploadTaskRequest request);

  $async.Future<$0.ResumeUploadTaskResponse> resumeTask_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ResumeUploadTaskRequest> $request) async {
    return resumeTask($call, await $request);
  }

  $async.Future<$0.ResumeUploadTaskResponse> resumeTask(
      $grpc.ServiceCall call, $0.ResumeUploadTaskRequest request);

  $async.Future<$0.RetryUploadTaskResponse> retryTask_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RetryUploadTaskRequest> $request) async {
    return retryTask($call, await $request);
  }

  $async.Future<$0.RetryUploadTaskResponse> retryTask(
      $grpc.ServiceCall call, $0.RetryUploadTaskRequest request);

  $async.Future<$0.ClearUploadCompletedResponse> clearCompleted_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ClearUploadCompletedRequest> $request) async {
    return clearCompleted($call, await $request);
  }

  $async.Future<$0.ClearUploadCompletedResponse> clearCompleted(
      $grpc.ServiceCall call, $0.ClearUploadCompletedRequest request);

  $async.Future<$0.UploadStatsResponse> getStats_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetUploadStatsRequest> $request) async {
    return getStats($call, await $request);
  }

  $async.Future<$0.UploadStatsResponse> getStats(
      $grpc.ServiceCall call, $0.GetUploadStatsRequest request);
}
