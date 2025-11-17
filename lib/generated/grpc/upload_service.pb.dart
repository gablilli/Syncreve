// This is a generated file - do not edit.
//
// Generated from upload_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'upload_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'upload_service.pbenum.dart';

class UploadTaskInfo extends $pb.GeneratedMessage {
  factory UploadTaskInfo({
    $core.String? id,
    $core.String? accountId,
    $core.String? localPath,
    $core.String? remotePath,
    $core.String? fileName,
    $fixnum.Int64? totalSize,
    $fixnum.Int64? uploadedSize,
    UploadTaskStatus? status,
    $core.String? error,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? completedAt,
    $core.double? speed,
    $core.double? progress,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (accountId != null) result.accountId = accountId;
    if (localPath != null) result.localPath = localPath;
    if (remotePath != null) result.remotePath = remotePath;
    if (fileName != null) result.fileName = fileName;
    if (totalSize != null) result.totalSize = totalSize;
    if (uploadedSize != null) result.uploadedSize = uploadedSize;
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (completedAt != null) result.completedAt = completedAt;
    if (speed != null) result.speed = speed;
    if (progress != null) result.progress = progress;
    return result;
  }

  UploadTaskInfo._();

  factory UploadTaskInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadTaskInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadTaskInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'accountId')
    ..aOS(3, _omitFieldNames ? '' : 'localPath')
    ..aOS(4, _omitFieldNames ? '' : 'remotePath')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aInt64(6, _omitFieldNames ? '' : 'totalSize')
    ..aInt64(7, _omitFieldNames ? '' : 'uploadedSize')
    ..aE<UploadTaskStatus>(8, _omitFieldNames ? '' : 'status',
        enumValues: UploadTaskStatus.values)
    ..aOS(9, _omitFieldNames ? '' : 'error')
    ..aOS(10, _omitFieldNames ? '' : 'createdAt')
    ..aOS(11, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(12, _omitFieldNames ? '' : 'completedAt')
    ..aD(13, _omitFieldNames ? '' : 'speed')
    ..aD(14, _omitFieldNames ? '' : 'progress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskInfo copyWith(void Function(UploadTaskInfo) updates) =>
      super.copyWith((message) => updates(message as UploadTaskInfo))
          as UploadTaskInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadTaskInfo create() => UploadTaskInfo._();
  @$core.override
  UploadTaskInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadTaskInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadTaskInfo>(create);
  static UploadTaskInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountId => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccountId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get localPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set localPath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLocalPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocalPath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get remotePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set remotePath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRemotePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemotePath() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalSize => $_getI64(5);
  @$pb.TagNumber(6)
  set totalSize($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get uploadedSize => $_getI64(6);
  @$pb.TagNumber(7)
  set uploadedSize($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUploadedSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadedSize() => $_clearField(7);

  @$pb.TagNumber(8)
  UploadTaskStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(UploadTaskStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get error => $_getSZ(8);
  @$pb.TagNumber(9)
  set error($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get createdAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set createdAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get updatedAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set updatedAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get completedAt => $_getSZ(11);
  @$pb.TagNumber(12)
  set completedAt($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCompletedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearCompletedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get speed => $_getN(12);
  @$pb.TagNumber(13)
  set speed($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSpeed() => $_has(12);
  @$pb.TagNumber(13)
  void clearSpeed() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get progress => $_getN(13);
  @$pb.TagNumber(14)
  set progress($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasProgress() => $_has(13);
  @$pb.TagNumber(14)
  void clearProgress() => $_clearField(14);
}

class AddUploadTaskRequest extends $pb.GeneratedMessage {
  factory AddUploadTaskRequest({
    $core.String? accountId,
    $core.String? localPath,
    $core.String? remotePath,
    $core.bool? overwrite,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (localPath != null) result.localPath = localPath;
    if (remotePath != null) result.remotePath = remotePath;
    if (overwrite != null) result.overwrite = overwrite;
    return result;
  }

  AddUploadTaskRequest._();

  factory AddUploadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddUploadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddUploadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'localPath')
    ..aOS(3, _omitFieldNames ? '' : 'remotePath')
    ..aOB(4, _omitFieldNames ? '' : 'overwrite')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUploadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUploadTaskRequest copyWith(void Function(AddUploadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as AddUploadTaskRequest))
          as AddUploadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUploadTaskRequest create() => AddUploadTaskRequest._();
  @$core.override
  AddUploadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddUploadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddUploadTaskRequest>(create);
  static AddUploadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get localPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set localPath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLocalPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPath() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get remotePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set remotePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemotePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemotePath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get overwrite => $_getBF(3);
  @$pb.TagNumber(4)
  set overwrite($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOverwrite() => $_has(3);
  @$pb.TagNumber(4)
  void clearOverwrite() => $_clearField(4);
}

class AddBatchUploadTasksRequest extends $pb.GeneratedMessage {
  factory AddBatchUploadTasksRequest({
    $core.String? accountId,
    $core.Iterable<UploadFileInfo>? files,
    $core.String? remoteBasePath,
    $core.bool? overwrite,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (files != null) result.files.addAll(files);
    if (remoteBasePath != null) result.remoteBasePath = remoteBasePath;
    if (overwrite != null) result.overwrite = overwrite;
    return result;
  }

  AddBatchUploadTasksRequest._();

  factory AddBatchUploadTasksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddBatchUploadTasksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddBatchUploadTasksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..pPM<UploadFileInfo>(2, _omitFieldNames ? '' : 'files',
        subBuilder: UploadFileInfo.create)
    ..aOS(3, _omitFieldNames ? '' : 'remoteBasePath')
    ..aOB(4, _omitFieldNames ? '' : 'overwrite')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddBatchUploadTasksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddBatchUploadTasksRequest copyWith(
          void Function(AddBatchUploadTasksRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AddBatchUploadTasksRequest))
          as AddBatchUploadTasksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddBatchUploadTasksRequest create() => AddBatchUploadTasksRequest._();
  @$core.override
  AddBatchUploadTasksRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddBatchUploadTasksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddBatchUploadTasksRequest>(create);
  static AddBatchUploadTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<UploadFileInfo> get files => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get remoteBasePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteBasePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemoteBasePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteBasePath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get overwrite => $_getBF(3);
  @$pb.TagNumber(4)
  set overwrite($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOverwrite() => $_has(3);
  @$pb.TagNumber(4)
  void clearOverwrite() => $_clearField(4);
}

class UploadFileInfo extends $pb.GeneratedMessage {
  factory UploadFileInfo({
    $core.String? localPath,
    $core.String? relativePath,
  }) {
    final result = create();
    if (localPath != null) result.localPath = localPath;
    if (relativePath != null) result.relativePath = relativePath;
    return result;
  }

  UploadFileInfo._();

  factory UploadFileInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadFileInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadFileInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localPath')
    ..aOS(2, _omitFieldNames ? '' : 'relativePath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadFileInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadFileInfo copyWith(void Function(UploadFileInfo) updates) =>
      super.copyWith((message) => updates(message as UploadFileInfo))
          as UploadFileInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadFileInfo create() => UploadFileInfo._();
  @$core.override
  UploadFileInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadFileInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadFileInfo>(create);
  static UploadFileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set localPath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLocalPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalPath() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relativePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set relativePath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelativePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelativePath() => $_clearField(2);
}

class AddUploadTaskResponse extends $pb.GeneratedMessage {
  factory AddUploadTaskResponse({
    $core.Iterable<$core.String>? taskIds,
  }) {
    final result = create();
    if (taskIds != null) result.taskIds.addAll(taskIds);
    return result;
  }

  AddUploadTaskResponse._();

  factory AddUploadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddUploadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddUploadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'taskIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUploadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddUploadTaskResponse copyWith(
          void Function(AddUploadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as AddUploadTaskResponse))
          as AddUploadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUploadTaskResponse create() => AddUploadTaskResponse._();
  @$core.override
  AddUploadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddUploadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddUploadTaskResponse>(create);
  static AddUploadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get taskIds => $_getList(0);
}

class CancelUploadTaskRequest extends $pb.GeneratedMessage {
  factory CancelUploadTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  CancelUploadTaskRequest._();

  factory CancelUploadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelUploadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelUploadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelUploadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelUploadTaskRequest copyWith(
          void Function(CancelUploadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as CancelUploadTaskRequest))
          as CancelUploadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelUploadTaskRequest create() => CancelUploadTaskRequest._();
  @$core.override
  CancelUploadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelUploadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelUploadTaskRequest>(create);
  static CancelUploadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class CancelUploadTaskResponse extends $pb.GeneratedMessage {
  factory CancelUploadTaskResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  CancelUploadTaskResponse._();

  factory CancelUploadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelUploadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelUploadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelUploadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelUploadTaskResponse copyWith(
          void Function(CancelUploadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as CancelUploadTaskResponse))
          as CancelUploadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelUploadTaskResponse create() => CancelUploadTaskResponse._();
  @$core.override
  CancelUploadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelUploadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelUploadTaskResponse>(create);
  static CancelUploadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);
}

class GetUploadTaskInfoRequest extends $pb.GeneratedMessage {
  factory GetUploadTaskInfoRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  GetUploadTaskInfoRequest._();

  factory GetUploadTaskInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUploadTaskInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUploadTaskInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadTaskInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadTaskInfoRequest copyWith(
          void Function(GetUploadTaskInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetUploadTaskInfoRequest))
          as GetUploadTaskInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUploadTaskInfoRequest create() => GetUploadTaskInfoRequest._();
  @$core.override
  GetUploadTaskInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUploadTaskInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUploadTaskInfoRequest>(create);
  static GetUploadTaskInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class UploadTaskInfoResponse extends $pb.GeneratedMessage {
  factory UploadTaskInfoResponse({
    UploadTaskInfo? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  UploadTaskInfoResponse._();

  factory UploadTaskInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadTaskInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadTaskInfoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<UploadTaskInfo>(1, _omitFieldNames ? '' : 'task',
        subBuilder: UploadTaskInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskInfoResponse copyWith(
          void Function(UploadTaskInfoResponse) updates) =>
      super.copyWith((message) => updates(message as UploadTaskInfoResponse))
          as UploadTaskInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadTaskInfoResponse create() => UploadTaskInfoResponse._();
  @$core.override
  UploadTaskInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadTaskInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadTaskInfoResponse>(create);
  static UploadTaskInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UploadTaskInfo get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(UploadTaskInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  UploadTaskInfo ensureTask() => $_ensure(0);
}

class ListUploadTasksRequest extends $pb.GeneratedMessage {
  factory ListUploadTasksRequest({
    $core.String? accountId,
    UploadTaskStatus? status,
    $core.int? page,
    $core.int? perPage,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (status != null) result.status = status;
    if (page != null) result.page = page;
    if (perPage != null) result.perPage = perPage;
    return result;
  }

  ListUploadTasksRequest._();

  factory ListUploadTasksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUploadTasksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUploadTasksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aE<UploadTaskStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: UploadTaskStatus.values)
    ..aI(3, _omitFieldNames ? '' : 'page')
    ..aI(4, _omitFieldNames ? '' : 'perPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUploadTasksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUploadTasksRequest copyWith(
          void Function(ListUploadTasksRequest) updates) =>
      super.copyWith((message) => updates(message as ListUploadTasksRequest))
          as ListUploadTasksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUploadTasksRequest create() => ListUploadTasksRequest._();
  @$core.override
  ListUploadTasksRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUploadTasksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUploadTasksRequest>(create);
  static ListUploadTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  UploadTaskStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(UploadTaskStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get perPage => $_getIZ(3);
  @$pb.TagNumber(4)
  set perPage($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPerPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPerPage() => $_clearField(4);
}

class ListUploadTasksResponse extends $pb.GeneratedMessage {
  factory ListUploadTasksResponse({
    $core.Iterable<UploadTaskInfo>? tasks,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (tasks != null) result.tasks.addAll(tasks);
    if (total != null) result.total = total;
    return result;
  }

  ListUploadTasksResponse._();

  factory ListUploadTasksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUploadTasksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUploadTasksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPM<UploadTaskInfo>(1, _omitFieldNames ? '' : 'tasks',
        subBuilder: UploadTaskInfo.create)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUploadTasksResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUploadTasksResponse copyWith(
          void Function(ListUploadTasksResponse) updates) =>
      super.copyWith((message) => updates(message as ListUploadTasksResponse))
          as ListUploadTasksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUploadTasksResponse create() => ListUploadTasksResponse._();
  @$core.override
  ListUploadTasksResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUploadTasksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUploadTasksResponse>(create);
  static ListUploadTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UploadTaskInfo> get tasks => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class WatchUploadTaskStatusRequest extends $pb.GeneratedMessage {
  factory WatchUploadTaskStatusRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  WatchUploadTaskStatusRequest._();

  factory WatchUploadTaskStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchUploadTaskStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchUploadTaskStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchUploadTaskStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchUploadTaskStatusRequest copyWith(
          void Function(WatchUploadTaskStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as WatchUploadTaskStatusRequest))
          as WatchUploadTaskStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchUploadTaskStatusRequest create() =>
      WatchUploadTaskStatusRequest._();
  @$core.override
  WatchUploadTaskStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WatchUploadTaskStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchUploadTaskStatusRequest>(create);
  static WatchUploadTaskStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class UploadTaskStatusUpdate extends $pb.GeneratedMessage {
  factory UploadTaskStatusUpdate({
    UploadTaskInfo? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  UploadTaskStatusUpdate._();

  factory UploadTaskStatusUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadTaskStatusUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadTaskStatusUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<UploadTaskInfo>(1, _omitFieldNames ? '' : 'task',
        subBuilder: UploadTaskInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskStatusUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadTaskStatusUpdate copyWith(
          void Function(UploadTaskStatusUpdate) updates) =>
      super.copyWith((message) => updates(message as UploadTaskStatusUpdate))
          as UploadTaskStatusUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadTaskStatusUpdate create() => UploadTaskStatusUpdate._();
  @$core.override
  UploadTaskStatusUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadTaskStatusUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadTaskStatusUpdate>(create);
  static UploadTaskStatusUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  UploadTaskInfo get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(UploadTaskInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  UploadTaskInfo ensureTask() => $_ensure(0);
}

class PauseUploadTaskRequest extends $pb.GeneratedMessage {
  factory PauseUploadTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  PauseUploadTaskRequest._();

  factory PauseUploadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseUploadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseUploadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseUploadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseUploadTaskRequest copyWith(
          void Function(PauseUploadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as PauseUploadTaskRequest))
          as PauseUploadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseUploadTaskRequest create() => PauseUploadTaskRequest._();
  @$core.override
  PauseUploadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PauseUploadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseUploadTaskRequest>(create);
  static PauseUploadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class PauseUploadTaskResponse extends $pb.GeneratedMessage {
  factory PauseUploadTaskResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  PauseUploadTaskResponse._();

  factory PauseUploadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseUploadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseUploadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseUploadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseUploadTaskResponse copyWith(
          void Function(PauseUploadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as PauseUploadTaskResponse))
          as PauseUploadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseUploadTaskResponse create() => PauseUploadTaskResponse._();
  @$core.override
  PauseUploadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PauseUploadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseUploadTaskResponse>(create);
  static PauseUploadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ResumeUploadTaskRequest extends $pb.GeneratedMessage {
  factory ResumeUploadTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  ResumeUploadTaskRequest._();

  factory ResumeUploadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeUploadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeUploadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeUploadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeUploadTaskRequest copyWith(
          void Function(ResumeUploadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as ResumeUploadTaskRequest))
          as ResumeUploadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeUploadTaskRequest create() => ResumeUploadTaskRequest._();
  @$core.override
  ResumeUploadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResumeUploadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeUploadTaskRequest>(create);
  static ResumeUploadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class ResumeUploadTaskResponse extends $pb.GeneratedMessage {
  factory ResumeUploadTaskResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ResumeUploadTaskResponse._();

  factory ResumeUploadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeUploadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeUploadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeUploadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeUploadTaskResponse copyWith(
          void Function(ResumeUploadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as ResumeUploadTaskResponse))
          as ResumeUploadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeUploadTaskResponse create() => ResumeUploadTaskResponse._();
  @$core.override
  ResumeUploadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResumeUploadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeUploadTaskResponse>(create);
  static ResumeUploadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RetryUploadTaskRequest extends $pb.GeneratedMessage {
  factory RetryUploadTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  RetryUploadTaskRequest._();

  factory RetryUploadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetryUploadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetryUploadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryUploadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryUploadTaskRequest copyWith(
          void Function(RetryUploadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as RetryUploadTaskRequest))
          as RetryUploadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetryUploadTaskRequest create() => RetryUploadTaskRequest._();
  @$core.override
  RetryUploadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RetryUploadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetryUploadTaskRequest>(create);
  static RetryUploadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class RetryUploadTaskResponse extends $pb.GeneratedMessage {
  factory RetryUploadTaskResponse({
    $core.bool? success,
    $core.String? newTaskId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (newTaskId != null) result.newTaskId = newTaskId;
    return result;
  }

  RetryUploadTaskResponse._();

  factory RetryUploadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetryUploadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetryUploadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'newTaskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryUploadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryUploadTaskResponse copyWith(
          void Function(RetryUploadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as RetryUploadTaskResponse))
          as RetryUploadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetryUploadTaskResponse create() => RetryUploadTaskResponse._();
  @$core.override
  RetryUploadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RetryUploadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetryUploadTaskResponse>(create);
  static RetryUploadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newTaskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set newTaskId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewTaskId() => $_clearField(2);
}

class ClearUploadCompletedRequest extends $pb.GeneratedMessage {
  factory ClearUploadCompletedRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  ClearUploadCompletedRequest._();

  factory ClearUploadCompletedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearUploadCompletedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearUploadCompletedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearUploadCompletedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearUploadCompletedRequest copyWith(
          void Function(ClearUploadCompletedRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ClearUploadCompletedRequest))
          as ClearUploadCompletedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearUploadCompletedRequest create() =>
      ClearUploadCompletedRequest._();
  @$core.override
  ClearUploadCompletedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClearUploadCompletedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearUploadCompletedRequest>(create);
  static ClearUploadCompletedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class ClearUploadCompletedResponse extends $pb.GeneratedMessage {
  factory ClearUploadCompletedResponse({
    $core.int? clearedCount,
  }) {
    final result = create();
    if (clearedCount != null) result.clearedCount = clearedCount;
    return result;
  }

  ClearUploadCompletedResponse._();

  factory ClearUploadCompletedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearUploadCompletedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearUploadCompletedResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'clearedCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearUploadCompletedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearUploadCompletedResponse copyWith(
          void Function(ClearUploadCompletedResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ClearUploadCompletedResponse))
          as ClearUploadCompletedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearUploadCompletedResponse create() =>
      ClearUploadCompletedResponse._();
  @$core.override
  ClearUploadCompletedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClearUploadCompletedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearUploadCompletedResponse>(create);
  static ClearUploadCompletedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clearedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set clearedCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClearedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearClearedCount() => $_clearField(1);
}

class GetUploadStatsRequest extends $pb.GeneratedMessage {
  factory GetUploadStatsRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  GetUploadStatsRequest._();

  factory GetUploadStatsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUploadStatsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUploadStatsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadStatsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadStatsRequest copyWith(
          void Function(GetUploadStatsRequest) updates) =>
      super.copyWith((message) => updates(message as GetUploadStatsRequest))
          as GetUploadStatsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUploadStatsRequest create() => GetUploadStatsRequest._();
  @$core.override
  GetUploadStatsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUploadStatsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUploadStatsRequest>(create);
  static GetUploadStatsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class UploadStatsResponse extends $pb.GeneratedMessage {
  factory UploadStatsResponse({
    $fixnum.Int64? totalTasks,
    $fixnum.Int64? waitingTasks,
    $fixnum.Int64? uploadingTasks,
    $fixnum.Int64? completedTasks,
    $fixnum.Int64? failedTasks,
    $core.double? totalUploadedSize,
    $core.double? currentSpeed,
  }) {
    final result = create();
    if (totalTasks != null) result.totalTasks = totalTasks;
    if (waitingTasks != null) result.waitingTasks = waitingTasks;
    if (uploadingTasks != null) result.uploadingTasks = uploadingTasks;
    if (completedTasks != null) result.completedTasks = completedTasks;
    if (failedTasks != null) result.failedTasks = failedTasks;
    if (totalUploadedSize != null) result.totalUploadedSize = totalUploadedSize;
    if (currentSpeed != null) result.currentSpeed = currentSpeed;
    return result;
  }

  UploadStatsResponse._();

  factory UploadStatsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadStatsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadStatsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalTasks')
    ..aInt64(2, _omitFieldNames ? '' : 'waitingTasks')
    ..aInt64(3, _omitFieldNames ? '' : 'uploadingTasks')
    ..aInt64(4, _omitFieldNames ? '' : 'completedTasks')
    ..aInt64(5, _omitFieldNames ? '' : 'failedTasks')
    ..aD(6, _omitFieldNames ? '' : 'totalUploadedSize')
    ..aD(7, _omitFieldNames ? '' : 'currentSpeed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadStatsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadStatsResponse copyWith(void Function(UploadStatsResponse) updates) =>
      super.copyWith((message) => updates(message as UploadStatsResponse))
          as UploadStatsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadStatsResponse create() => UploadStatsResponse._();
  @$core.override
  UploadStatsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadStatsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadStatsResponse>(create);
  static UploadStatsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalTasks => $_getI64(0);
  @$pb.TagNumber(1)
  set totalTasks($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalTasks() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalTasks() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get waitingTasks => $_getI64(1);
  @$pb.TagNumber(2)
  set waitingTasks($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWaitingTasks() => $_has(1);
  @$pb.TagNumber(2)
  void clearWaitingTasks() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get uploadingTasks => $_getI64(2);
  @$pb.TagNumber(3)
  set uploadingTasks($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUploadingTasks() => $_has(2);
  @$pb.TagNumber(3)
  void clearUploadingTasks() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get completedTasks => $_getI64(3);
  @$pb.TagNumber(4)
  set completedTasks($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCompletedTasks() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompletedTasks() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get failedTasks => $_getI64(4);
  @$pb.TagNumber(5)
  set failedTasks($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFailedTasks() => $_has(4);
  @$pb.TagNumber(5)
  void clearFailedTasks() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get totalUploadedSize => $_getN(5);
  @$pb.TagNumber(6)
  set totalUploadedSize($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalUploadedSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalUploadedSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get currentSpeed => $_getN(6);
  @$pb.TagNumber(7)
  set currentSpeed($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCurrentSpeed() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentSpeed() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
