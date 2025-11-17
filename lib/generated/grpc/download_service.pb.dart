// This is a generated file - do not edit.
//
// Generated from download_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'download_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'download_service.pbenum.dart';

class DownloadTaskInfo extends $pb.GeneratedMessage {
  factory DownloadTaskInfo({
    $core.String? id,
    $core.String? accountId,
    $core.String? fileId,
    $core.String? fileName,
    $core.String? savePath,
    $fixnum.Int64? totalSize,
    $fixnum.Int64? downloadedSize,
    TaskStatus? status,
    TaskType? type,
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
    if (fileId != null) result.fileId = fileId;
    if (fileName != null) result.fileName = fileName;
    if (savePath != null) result.savePath = savePath;
    if (totalSize != null) result.totalSize = totalSize;
    if (downloadedSize != null) result.downloadedSize = downloadedSize;
    if (status != null) result.status = status;
    if (type != null) result.type = type;
    if (error != null) result.error = error;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (completedAt != null) result.completedAt = completedAt;
    if (speed != null) result.speed = speed;
    if (progress != null) result.progress = progress;
    return result;
  }

  DownloadTaskInfo._();

  factory DownloadTaskInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DownloadTaskInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DownloadTaskInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'accountId')
    ..aOS(3, _omitFieldNames ? '' : 'fileId')
    ..aOS(4, _omitFieldNames ? '' : 'fileName')
    ..aOS(5, _omitFieldNames ? '' : 'savePath')
    ..aInt64(6, _omitFieldNames ? '' : 'totalSize')
    ..aInt64(7, _omitFieldNames ? '' : 'downloadedSize')
    ..aE<TaskStatus>(8, _omitFieldNames ? '' : 'status',
        enumValues: TaskStatus.values)
    ..aE<TaskType>(9, _omitFieldNames ? '' : 'type',
        enumValues: TaskType.values)
    ..aOS(10, _omitFieldNames ? '' : 'error')
    ..aOS(11, _omitFieldNames ? '' : 'createdAt')
    ..aOS(12, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(13, _omitFieldNames ? '' : 'completedAt')
    ..aD(14, _omitFieldNames ? '' : 'speed')
    ..aD(15, _omitFieldNames ? '' : 'progress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadTaskInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadTaskInfo copyWith(void Function(DownloadTaskInfo) updates) =>
      super.copyWith((message) => updates(message as DownloadTaskInfo))
          as DownloadTaskInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadTaskInfo create() => DownloadTaskInfo._();
  @$core.override
  DownloadTaskInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DownloadTaskInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DownloadTaskInfo>(create);
  static DownloadTaskInfo? _defaultInstance;

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
  $core.String get fileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fileName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fileName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFileName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get savePath => $_getSZ(4);
  @$pb.TagNumber(5)
  set savePath($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSavePath() => $_has(4);
  @$pb.TagNumber(5)
  void clearSavePath() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalSize => $_getI64(5);
  @$pb.TagNumber(6)
  set totalSize($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get downloadedSize => $_getI64(6);
  @$pb.TagNumber(7)
  set downloadedSize($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDownloadedSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearDownloadedSize() => $_clearField(7);

  @$pb.TagNumber(8)
  TaskStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(TaskStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  TaskType get type => $_getN(8);
  @$pb.TagNumber(9)
  set type(TaskType value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get error => $_getSZ(9);
  @$pb.TagNumber(10)
  set error($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasError() => $_has(9);
  @$pb.TagNumber(10)
  void clearError() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get updatedAt => $_getSZ(11);
  @$pb.TagNumber(12)
  set updatedAt($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUpdatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdatedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get completedAt => $_getSZ(12);
  @$pb.TagNumber(13)
  set completedAt($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCompletedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearCompletedAt() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get speed => $_getN(13);
  @$pb.TagNumber(14)
  set speed($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasSpeed() => $_has(13);
  @$pb.TagNumber(14)
  void clearSpeed() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get progress => $_getN(14);
  @$pb.TagNumber(15)
  set progress($core.double value) => $_setDouble(14, value);
  @$pb.TagNumber(15)
  $core.bool hasProgress() => $_has(14);
  @$pb.TagNumber(15)
  void clearProgress() => $_clearField(15);
}

class AddDownloadTaskRequest extends $pb.GeneratedMessage {
  factory AddDownloadTaskRequest({
    $core.String? accountId,
    $core.Iterable<FileToDownload>? files,
    $core.String? savePath,
    TaskType? type,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (files != null) result.files.addAll(files);
    if (savePath != null) result.savePath = savePath;
    if (type != null) result.type = type;
    return result;
  }

  AddDownloadTaskRequest._();

  factory AddDownloadTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddDownloadTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddDownloadTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..pPM<FileToDownload>(2, _omitFieldNames ? '' : 'files',
        subBuilder: FileToDownload.create)
    ..aOS(3, _omitFieldNames ? '' : 'savePath')
    ..aE<TaskType>(4, _omitFieldNames ? '' : 'type',
        enumValues: TaskType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTaskRequest copyWith(
          void Function(AddDownloadTaskRequest) updates) =>
      super.copyWith((message) => updates(message as AddDownloadTaskRequest))
          as AddDownloadTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDownloadTaskRequest create() => AddDownloadTaskRequest._();
  @$core.override
  AddDownloadTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddDownloadTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddDownloadTaskRequest>(create);
  static AddDownloadTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<FileToDownload> get files => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get savePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set savePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSavePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearSavePath() => $_clearField(3);

  @$pb.TagNumber(4)
  TaskType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(TaskType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

class FileToDownload extends $pb.GeneratedMessage {
  factory FileToDownload({
    $core.String? fileId,
    $core.String? fileName,
    $core.String? uri,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (fileName != null) result.fileName = fileName;
    if (uri != null) result.uri = uri;
    return result;
  }

  FileToDownload._();

  factory FileToDownload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileToDownload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileToDownload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'uri')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileToDownload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileToDownload copyWith(void Function(FileToDownload) updates) =>
      super.copyWith((message) => updates(message as FileToDownload))
          as FileToDownload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileToDownload create() => FileToDownload._();
  @$core.override
  FileToDownload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileToDownload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileToDownload>(create);
  static FileToDownload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get uri => $_getSZ(2);
  @$pb.TagNumber(3)
  set uri($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearUri() => $_clearField(3);
}

class AddDownloadTasksByDirRequest extends $pb.GeneratedMessage {
  factory AddDownloadTasksByDirRequest({
    $core.String? accountId,
    $core.String? dirPath,
    $core.String? savePath,
    TaskType? type,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (dirPath != null) result.dirPath = dirPath;
    if (savePath != null) result.savePath = savePath;
    if (type != null) result.type = type;
    return result;
  }

  AddDownloadTasksByDirRequest._();

  factory AddDownloadTasksByDirRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddDownloadTasksByDirRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddDownloadTasksByDirRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'dirPath')
    ..aOS(3, _omitFieldNames ? '' : 'savePath')
    ..aE<TaskType>(4, _omitFieldNames ? '' : 'type',
        enumValues: TaskType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTasksByDirRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTasksByDirRequest copyWith(
          void Function(AddDownloadTasksByDirRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AddDownloadTasksByDirRequest))
          as AddDownloadTasksByDirRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDownloadTasksByDirRequest create() =>
      AddDownloadTasksByDirRequest._();
  @$core.override
  AddDownloadTasksByDirRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddDownloadTasksByDirRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddDownloadTasksByDirRequest>(create);
  static AddDownloadTasksByDirRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dirPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set dirPath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDirPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirPath() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get savePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set savePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSavePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearSavePath() => $_clearField(3);

  @$pb.TagNumber(4)
  TaskType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(TaskType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

class AddDownloadTaskResponse extends $pb.GeneratedMessage {
  factory AddDownloadTaskResponse({
    $core.Iterable<$core.String>? taskIds,
  }) {
    final result = create();
    if (taskIds != null) result.taskIds.addAll(taskIds);
    return result;
  }

  AddDownloadTaskResponse._();

  factory AddDownloadTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddDownloadTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddDownloadTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'taskIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDownloadTaskResponse copyWith(
          void Function(AddDownloadTaskResponse) updates) =>
      super.copyWith((message) => updates(message as AddDownloadTaskResponse))
          as AddDownloadTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDownloadTaskResponse create() => AddDownloadTaskResponse._();
  @$core.override
  AddDownloadTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddDownloadTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddDownloadTaskResponse>(create);
  static AddDownloadTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get taskIds => $_getList(0);
}

class CancelTaskRequest extends $pb.GeneratedMessage {
  factory CancelTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  CancelTaskRequest._();

  factory CancelTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTaskRequest copyWith(void Function(CancelTaskRequest) updates) =>
      super.copyWith((message) => updates(message as CancelTaskRequest))
          as CancelTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelTaskRequest create() => CancelTaskRequest._();
  @$core.override
  CancelTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelTaskRequest>(create);
  static CancelTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class CancelTaskResponse extends $pb.GeneratedMessage {
  factory CancelTaskResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  CancelTaskResponse._();

  factory CancelTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTaskResponse copyWith(void Function(CancelTaskResponse) updates) =>
      super.copyWith((message) => updates(message as CancelTaskResponse))
          as CancelTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelTaskResponse create() => CancelTaskResponse._();
  @$core.override
  CancelTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelTaskResponse>(create);
  static CancelTaskResponse? _defaultInstance;

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

class GetTaskInfoRequest extends $pb.GeneratedMessage {
  factory GetTaskInfoRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  GetTaskInfoRequest._();

  factory GetTaskInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTaskInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTaskInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTaskInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTaskInfoRequest copyWith(void Function(GetTaskInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetTaskInfoRequest))
          as GetTaskInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskInfoRequest create() => GetTaskInfoRequest._();
  @$core.override
  GetTaskInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTaskInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTaskInfoRequest>(create);
  static GetTaskInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class TaskInfoResponse extends $pb.GeneratedMessage {
  factory TaskInfoResponse({
    DownloadTaskInfo? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  TaskInfoResponse._();

  factory TaskInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskInfoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<DownloadTaskInfo>(1, _omitFieldNames ? '' : 'task',
        subBuilder: DownloadTaskInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskInfoResponse copyWith(void Function(TaskInfoResponse) updates) =>
      super.copyWith((message) => updates(message as TaskInfoResponse))
          as TaskInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskInfoResponse create() => TaskInfoResponse._();
  @$core.override
  TaskInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskInfoResponse>(create);
  static TaskInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  DownloadTaskInfo get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(DownloadTaskInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  DownloadTaskInfo ensureTask() => $_ensure(0);
}

class ListTasksRequest extends $pb.GeneratedMessage {
  factory ListTasksRequest({
    $core.String? accountId,
    TaskStatus? status,
    TaskType? type,
    $core.int? page,
    $core.int? perPage,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (status != null) result.status = status;
    if (type != null) result.type = type;
    if (page != null) result.page = page;
    if (perPage != null) result.perPage = perPage;
    return result;
  }

  ListTasksRequest._();

  factory ListTasksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTasksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTasksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aE<TaskStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: TaskStatus.values)
    ..aE<TaskType>(3, _omitFieldNames ? '' : 'type',
        enumValues: TaskType.values)
    ..aI(4, _omitFieldNames ? '' : 'page')
    ..aI(5, _omitFieldNames ? '' : 'perPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksRequest copyWith(void Function(ListTasksRequest) updates) =>
      super.copyWith((message) => updates(message as ListTasksRequest))
          as ListTasksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksRequest create() => ListTasksRequest._();
  @$core.override
  ListTasksRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTasksRequest>(create);
  static ListTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  TaskStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(TaskStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  TaskType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(TaskType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get perPage => $_getIZ(4);
  @$pb.TagNumber(5)
  set perPage($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPerPage() => $_has(4);
  @$pb.TagNumber(5)
  void clearPerPage() => $_clearField(5);
}

class ListTasksResponse extends $pb.GeneratedMessage {
  factory ListTasksResponse({
    $core.Iterable<DownloadTaskInfo>? tasks,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (tasks != null) result.tasks.addAll(tasks);
    if (total != null) result.total = total;
    return result;
  }

  ListTasksResponse._();

  factory ListTasksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTasksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTasksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPM<DownloadTaskInfo>(1, _omitFieldNames ? '' : 'tasks',
        subBuilder: DownloadTaskInfo.create)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTasksResponse copyWith(void Function(ListTasksResponse) updates) =>
      super.copyWith((message) => updates(message as ListTasksResponse))
          as ListTasksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksResponse create() => ListTasksResponse._();
  @$core.override
  ListTasksResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTasksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTasksResponse>(create);
  static ListTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DownloadTaskInfo> get tasks => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class WatchTaskStatusRequest extends $pb.GeneratedMessage {
  factory WatchTaskStatusRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  WatchTaskStatusRequest._();

  factory WatchTaskStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchTaskStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchTaskStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchTaskStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchTaskStatusRequest copyWith(
          void Function(WatchTaskStatusRequest) updates) =>
      super.copyWith((message) => updates(message as WatchTaskStatusRequest))
          as WatchTaskStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchTaskStatusRequest create() => WatchTaskStatusRequest._();
  @$core.override
  WatchTaskStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WatchTaskStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchTaskStatusRequest>(create);
  static WatchTaskStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class TaskStatusUpdate extends $pb.GeneratedMessage {
  factory TaskStatusUpdate({
    DownloadTaskInfo? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  TaskStatusUpdate._();

  factory TaskStatusUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskStatusUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskStatusUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<DownloadTaskInfo>(1, _omitFieldNames ? '' : 'task',
        subBuilder: DownloadTaskInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskStatusUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskStatusUpdate copyWith(void Function(TaskStatusUpdate) updates) =>
      super.copyWith((message) => updates(message as TaskStatusUpdate))
          as TaskStatusUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskStatusUpdate create() => TaskStatusUpdate._();
  @$core.override
  TaskStatusUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskStatusUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskStatusUpdate>(create);
  static TaskStatusUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  DownloadTaskInfo get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(DownloadTaskInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  DownloadTaskInfo ensureTask() => $_ensure(0);
}

class PauseTaskRequest extends $pb.GeneratedMessage {
  factory PauseTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  PauseTaskRequest._();

  factory PauseTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseTaskRequest copyWith(void Function(PauseTaskRequest) updates) =>
      super.copyWith((message) => updates(message as PauseTaskRequest))
          as PauseTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseTaskRequest create() => PauseTaskRequest._();
  @$core.override
  PauseTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PauseTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseTaskRequest>(create);
  static PauseTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class PauseTaskResponse extends $pb.GeneratedMessage {
  factory PauseTaskResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  PauseTaskResponse._();

  factory PauseTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseTaskResponse copyWith(void Function(PauseTaskResponse) updates) =>
      super.copyWith((message) => updates(message as PauseTaskResponse))
          as PauseTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseTaskResponse create() => PauseTaskResponse._();
  @$core.override
  PauseTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PauseTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseTaskResponse>(create);
  static PauseTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ResumeTaskRequest extends $pb.GeneratedMessage {
  factory ResumeTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  ResumeTaskRequest._();

  factory ResumeTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeTaskRequest copyWith(void Function(ResumeTaskRequest) updates) =>
      super.copyWith((message) => updates(message as ResumeTaskRequest))
          as ResumeTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeTaskRequest create() => ResumeTaskRequest._();
  @$core.override
  ResumeTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResumeTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeTaskRequest>(create);
  static ResumeTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class ResumeTaskResponse extends $pb.GeneratedMessage {
  factory ResumeTaskResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ResumeTaskResponse._();

  factory ResumeTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeTaskResponse copyWith(void Function(ResumeTaskResponse) updates) =>
      super.copyWith((message) => updates(message as ResumeTaskResponse))
          as ResumeTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeTaskResponse create() => ResumeTaskResponse._();
  @$core.override
  ResumeTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResumeTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeTaskResponse>(create);
  static ResumeTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RetryTaskRequest extends $pb.GeneratedMessage {
  factory RetryTaskRequest({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  RetryTaskRequest._();

  factory RetryTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetryTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetryTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryTaskRequest copyWith(void Function(RetryTaskRequest) updates) =>
      super.copyWith((message) => updates(message as RetryTaskRequest))
          as RetryTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetryTaskRequest create() => RetryTaskRequest._();
  @$core.override
  RetryTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RetryTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetryTaskRequest>(create);
  static RetryTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class RetryTaskResponse extends $pb.GeneratedMessage {
  factory RetryTaskResponse({
    $core.bool? success,
    $core.String? newTaskId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (newTaskId != null) result.newTaskId = newTaskId;
    return result;
  }

  RetryTaskResponse._();

  factory RetryTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetryTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetryTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'newTaskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryTaskResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetryTaskResponse copyWith(void Function(RetryTaskResponse) updates) =>
      super.copyWith((message) => updates(message as RetryTaskResponse))
          as RetryTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetryTaskResponse create() => RetryTaskResponse._();
  @$core.override
  RetryTaskResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RetryTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetryTaskResponse>(create);
  static RetryTaskResponse? _defaultInstance;

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

class ClearCompletedRequest extends $pb.GeneratedMessage {
  factory ClearCompletedRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  ClearCompletedRequest._();

  factory ClearCompletedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearCompletedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearCompletedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearCompletedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearCompletedRequest copyWith(
          void Function(ClearCompletedRequest) updates) =>
      super.copyWith((message) => updates(message as ClearCompletedRequest))
          as ClearCompletedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearCompletedRequest create() => ClearCompletedRequest._();
  @$core.override
  ClearCompletedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClearCompletedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearCompletedRequest>(create);
  static ClearCompletedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class ClearCompletedResponse extends $pb.GeneratedMessage {
  factory ClearCompletedResponse({
    $core.int? clearedCount,
  }) {
    final result = create();
    if (clearedCount != null) result.clearedCount = clearedCount;
    return result;
  }

  ClearCompletedResponse._();

  factory ClearCompletedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearCompletedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearCompletedResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'clearedCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearCompletedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearCompletedResponse copyWith(
          void Function(ClearCompletedResponse) updates) =>
      super.copyWith((message) => updates(message as ClearCompletedResponse))
          as ClearCompletedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearCompletedResponse create() => ClearCompletedResponse._();
  @$core.override
  ClearCompletedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClearCompletedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearCompletedResponse>(create);
  static ClearCompletedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clearedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set clearedCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClearedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearClearedCount() => $_clearField(1);
}

class GetStatsRequest extends $pb.GeneratedMessage {
  factory GetStatsRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  GetStatsRequest._();

  factory GetStatsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStatsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStatsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStatsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStatsRequest copyWith(void Function(GetStatsRequest) updates) =>
      super.copyWith((message) => updates(message as GetStatsRequest))
          as GetStatsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStatsRequest create() => GetStatsRequest._();
  @$core.override
  GetStatsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetStatsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStatsRequest>(create);
  static GetStatsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class StatsResponse extends $pb.GeneratedMessage {
  factory StatsResponse({
    $fixnum.Int64? totalTasks,
    $fixnum.Int64? waitingTasks,
    $fixnum.Int64? downloadingTasks,
    $fixnum.Int64? completedTasks,
    $fixnum.Int64? failedTasks,
    $core.double? totalDownloadedSize,
    $core.double? currentSpeed,
  }) {
    final result = create();
    if (totalTasks != null) result.totalTasks = totalTasks;
    if (waitingTasks != null) result.waitingTasks = waitingTasks;
    if (downloadingTasks != null) result.downloadingTasks = downloadingTasks;
    if (completedTasks != null) result.completedTasks = completedTasks;
    if (failedTasks != null) result.failedTasks = failedTasks;
    if (totalDownloadedSize != null)
      result.totalDownloadedSize = totalDownloadedSize;
    if (currentSpeed != null) result.currentSpeed = currentSpeed;
    return result;
  }

  StatsResponse._();

  factory StatsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StatsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StatsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalTasks')
    ..aInt64(2, _omitFieldNames ? '' : 'waitingTasks')
    ..aInt64(3, _omitFieldNames ? '' : 'downloadingTasks')
    ..aInt64(4, _omitFieldNames ? '' : 'completedTasks')
    ..aInt64(5, _omitFieldNames ? '' : 'failedTasks')
    ..aD(6, _omitFieldNames ? '' : 'totalDownloadedSize')
    ..aD(7, _omitFieldNames ? '' : 'currentSpeed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatsResponse copyWith(void Function(StatsResponse) updates) =>
      super.copyWith((message) => updates(message as StatsResponse))
          as StatsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatsResponse create() => StatsResponse._();
  @$core.override
  StatsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StatsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatsResponse>(create);
  static StatsResponse? _defaultInstance;

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
  $fixnum.Int64 get downloadingTasks => $_getI64(2);
  @$pb.TagNumber(3)
  set downloadingTasks($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDownloadingTasks() => $_has(2);
  @$pb.TagNumber(3)
  void clearDownloadingTasks() => $_clearField(3);

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
  $core.double get totalDownloadedSize => $_getN(5);
  @$pb.TagNumber(6)
  set totalDownloadedSize($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalDownloadedSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalDownloadedSize() => $_clearField(6);

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
