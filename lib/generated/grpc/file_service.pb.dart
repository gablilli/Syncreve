// This is a generated file - do not edit.
//
// Generated from file_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ListFilesRequest extends $pb.GeneratedMessage {
  factory ListFilesRequest({
    $core.String? accountId,
    $core.String? path,
    $core.int? page,
    $core.int? perPage,
    $core.String? orderBy,
    $core.bool? orderDirectionDesc,
    $core.String? keywords,
    $core.bool? refresh,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (path != null) result.path = path;
    if (page != null) result.page = page;
    if (perPage != null) result.perPage = perPage;
    if (orderBy != null) result.orderBy = orderBy;
    if (orderDirectionDesc != null)
      result.orderDirectionDesc = orderDirectionDesc;
    if (keywords != null) result.keywords = keywords;
    if (refresh != null) result.refresh = refresh;
    return result;
  }

  ListFilesRequest._();

  factory ListFilesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListFilesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFilesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aI(3, _omitFieldNames ? '' : 'page')
    ..aI(4, _omitFieldNames ? '' : 'perPage')
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..aOB(6, _omitFieldNames ? '' : 'orderDirectionDesc')
    ..aOS(7, _omitFieldNames ? '' : 'keywords')
    ..aOB(8, _omitFieldNames ? '' : 'refresh')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListFilesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListFilesRequest copyWith(void Function(ListFilesRequest) updates) =>
      super.copyWith((message) => updates(message as ListFilesRequest))
          as ListFilesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFilesRequest create() => ListFilesRequest._();
  @$core.override
  ListFilesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListFilesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFilesRequest>(create);
  static ListFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);

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

  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get orderDirectionDesc => $_getBF(5);
  @$pb.TagNumber(6)
  set orderDirectionDesc($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderDirectionDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderDirectionDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get keywords => $_getSZ(6);
  @$pb.TagNumber(7)
  set keywords($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasKeywords() => $_has(6);
  @$pb.TagNumber(7)
  void clearKeywords() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get refresh => $_getBF(7);
  @$pb.TagNumber(8)
  set refresh($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRefresh() => $_has(7);
  @$pb.TagNumber(8)
  void clearRefresh() => $_clearField(8);
}

class ListFilesResponse extends $pb.GeneratedMessage {
  factory ListFilesResponse({
    $core.Iterable<FileInfo>? files,
    $fixnum.Int64? total,
    $core.String? parentId,
    $core.String? parentPath,
  }) {
    final result = create();
    if (files != null) result.files.addAll(files);
    if (total != null) result.total = total;
    if (parentId != null) result.parentId = parentId;
    if (parentPath != null) result.parentPath = parentPath;
    return result;
  }

  ListFilesResponse._();

  factory ListFilesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListFilesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFilesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPM<FileInfo>(1, _omitFieldNames ? '' : 'files',
        subBuilder: FileInfo.create)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..aOS(3, _omitFieldNames ? '' : 'parentId')
    ..aOS(4, _omitFieldNames ? '' : 'parentPath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListFilesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListFilesResponse copyWith(void Function(ListFilesResponse) updates) =>
      super.copyWith((message) => updates(message as ListFilesResponse))
          as ListFilesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFilesResponse create() => ListFilesResponse._();
  @$core.override
  ListFilesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListFilesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFilesResponse>(create);
  static ListFilesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FileInfo> get files => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get parentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get parentPath => $_getSZ(3);
  @$pb.TagNumber(4)
  set parentPath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParentPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentPath() => $_clearField(4);
}

class FileInfo extends $pb.GeneratedMessage {
  factory FileInfo({
    $core.String? id,
    $core.String? name,
    $core.String? path,
    $fixnum.Int64? size,
    $core.String? type,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? sourceUrl,
    $core.int? sourceEnabled,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (path != null) result.path = path;
    if (size != null) result.size = size;
    if (type != null) result.type = type;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (sourceUrl != null) result.sourceUrl = sourceUrl;
    if (sourceEnabled != null) result.sourceEnabled = sourceEnabled;
    return result;
  }

  FileInfo._();

  factory FileInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'path')
    ..aInt64(4, _omitFieldNames ? '' : 'size')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..aOS(6, _omitFieldNames ? '' : 'createdAt')
    ..aOS(7, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(8, _omitFieldNames ? '' : 'sourceUrl')
    ..aI(9, _omitFieldNames ? '' : 'sourceEnabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfo copyWith(void Function(FileInfo) updates) =>
      super.copyWith((message) => updates(message as FileInfo)) as FileInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileInfo create() => FileInfo._();
  @$core.override
  FileInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileInfo>(create);
  static FileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createdAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get updatedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set updatedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get sourceUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set sourceUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSourceUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearSourceUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get sourceEnabled => $_getIZ(8);
  @$pb.TagNumber(9)
  set sourceEnabled($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSourceEnabled() => $_has(8);
  @$pb.TagNumber(9)
  void clearSourceEnabled() => $_clearField(9);
}

class GetFileInfoRequest extends $pb.GeneratedMessage {
  factory GetFileInfoRequest({
    $core.String? accountId,
    $core.String? uri,
    $core.bool? traceRoot,
    $core.bool? isFolder,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (uri != null) result.uri = uri;
    if (traceRoot != null) result.traceRoot = traceRoot;
    if (isFolder != null) result.isFolder = isFolder;
    return result;
  }

  GetFileInfoRequest._();

  factory GetFileInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFileInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFileInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'uri')
    ..aOB(3, _omitFieldNames ? '' : 'traceRoot')
    ..aOB(4, _omitFieldNames ? '' : 'isFolder')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFileInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFileInfoRequest copyWith(void Function(GetFileInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetFileInfoRequest))
          as GetFileInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileInfoRequest create() => GetFileInfoRequest._();
  @$core.override
  GetFileInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFileInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFileInfoRequest>(create);
  static GetFileInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uri => $_getSZ(1);
  @$pb.TagNumber(2)
  set uri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearUri() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get traceRoot => $_getBF(2);
  @$pb.TagNumber(3)
  set traceRoot($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTraceRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearTraceRoot() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isFolder => $_getBF(3);
  @$pb.TagNumber(4)
  set isFolder($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsFolder() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsFolder() => $_clearField(4);
}

class FileInfoResponse extends $pb.GeneratedMessage {
  factory FileInfoResponse({
    FileInfo? file,
  }) {
    final result = create();
    if (file != null) result.file = file;
    return result;
  }

  FileInfoResponse._();

  factory FileInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileInfoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<FileInfo>(1, _omitFieldNames ? '' : 'file',
        subBuilder: FileInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfoResponse copyWith(void Function(FileInfoResponse) updates) =>
      super.copyWith((message) => updates(message as FileInfoResponse))
          as FileInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileInfoResponse create() => FileInfoResponse._();
  @$core.override
  FileInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileInfoResponse>(create);
  static FileInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  FileInfo get file => $_getN(0);
  @$pb.TagNumber(1)
  set file(FileInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => $_clearField(1);
  @$pb.TagNumber(1)
  FileInfo ensureFile() => $_ensure(0);
}

class CreateFileRequest extends $pb.GeneratedMessage {
  factory CreateFileRequest({
    $core.String? accountId,
    $core.String? path,
    $core.String? name,
    $core.String? type,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (path != null) result.path = path;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    return result;
  }

  CreateFileRequest._();

  factory CreateFileRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFileRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFileRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFileRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFileRequest copyWith(void Function(CreateFileRequest) updates) =>
      super.copyWith((message) => updates(message as CreateFileRequest))
          as CreateFileRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFileRequest create() => CreateFileRequest._();
  @$core.override
  CreateFileRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFileRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFileRequest>(create);
  static CreateFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

class DeleteFilesRequest extends $pb.GeneratedMessage {
  factory DeleteFilesRequest({
    $core.String? accountId,
    $core.Iterable<$core.String>? uris,
    $core.bool? force,
    $core.bool? unlink,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (uris != null) result.uris.addAll(uris);
    if (force != null) result.force = force;
    if (unlink != null) result.unlink = unlink;
    return result;
  }

  DeleteFilesRequest._();

  factory DeleteFilesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteFilesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteFilesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..pPS(2, _omitFieldNames ? '' : 'uris')
    ..aOB(3, _omitFieldNames ? '' : 'force')
    ..aOB(4, _omitFieldNames ? '' : 'unlink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteFilesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteFilesRequest copyWith(void Function(DeleteFilesRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteFilesRequest))
          as DeleteFilesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFilesRequest create() => DeleteFilesRequest._();
  @$core.override
  DeleteFilesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteFilesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteFilesRequest>(create);
  static DeleteFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get uris => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get force => $_getBF(2);
  @$pb.TagNumber(3)
  set force($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasForce() => $_has(2);
  @$pb.TagNumber(3)
  void clearForce() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get unlink => $_getBF(3);
  @$pb.TagNumber(4)
  set unlink($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnlink() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnlink() => $_clearField(4);
}

class DeleteFilesResponse extends $pb.GeneratedMessage {
  factory DeleteFilesResponse({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  DeleteFilesResponse._();

  factory DeleteFilesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteFilesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteFilesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteFilesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteFilesResponse copyWith(void Function(DeleteFilesResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteFilesResponse))
          as DeleteFilesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFilesResponse create() => DeleteFilesResponse._();
  @$core.override
  DeleteFilesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteFilesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteFilesResponse>(create);
  static DeleteFilesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

class RenameFileRequest extends $pb.GeneratedMessage {
  factory RenameFileRequest({
    $core.String? accountId,
    $core.String? uri,
    $core.String? newName,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (uri != null) result.uri = uri;
    if (newName != null) result.newName = newName;
    return result;
  }

  RenameFileRequest._();

  factory RenameFileRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenameFileRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenameFileRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'uri')
    ..aOS(3, _omitFieldNames ? '' : 'newName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenameFileRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenameFileRequest copyWith(void Function(RenameFileRequest) updates) =>
      super.copyWith((message) => updates(message as RenameFileRequest))
          as RenameFileRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFileRequest create() => RenameFileRequest._();
  @$core.override
  RenameFileRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenameFileRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenameFileRequest>(create);
  static RenameFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uri => $_getSZ(1);
  @$pb.TagNumber(2)
  set uri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearUri() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newName => $_getSZ(2);
  @$pb.TagNumber(3)
  set newName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewName() => $_clearField(3);
}

class MoveFilesRequest extends $pb.GeneratedMessage {
  factory MoveFilesRequest({
    $core.String? accountId,
    $core.Iterable<$core.String>? srcUris,
    $core.String? dstPath,
    $core.bool? overwrite,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (srcUris != null) result.srcUris.addAll(srcUris);
    if (dstPath != null) result.dstPath = dstPath;
    if (overwrite != null) result.overwrite = overwrite;
    return result;
  }

  MoveFilesRequest._();

  factory MoveFilesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MoveFilesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MoveFilesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..pPS(2, _omitFieldNames ? '' : 'srcUris')
    ..aOS(3, _omitFieldNames ? '' : 'dstPath')
    ..aOB(4, _omitFieldNames ? '' : 'overwrite')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoveFilesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoveFilesRequest copyWith(void Function(MoveFilesRequest) updates) =>
      super.copyWith((message) => updates(message as MoveFilesRequest))
          as MoveFilesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFilesRequest create() => MoveFilesRequest._();
  @$core.override
  MoveFilesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MoveFilesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MoveFilesRequest>(create);
  static MoveFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get srcUris => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get dstPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set dstPath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDstPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearDstPath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get overwrite => $_getBF(3);
  @$pb.TagNumber(4)
  set overwrite($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOverwrite() => $_has(3);
  @$pb.TagNumber(4)
  void clearOverwrite() => $_clearField(4);
}

class MoveFilesResponse extends $pb.GeneratedMessage {
  factory MoveFilesResponse({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  MoveFilesResponse._();

  factory MoveFilesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MoveFilesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MoveFilesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoveFilesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoveFilesResponse copyWith(void Function(MoveFilesResponse) updates) =>
      super.copyWith((message) => updates(message as MoveFilesResponse))
          as MoveFilesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFilesResponse create() => MoveFilesResponse._();
  @$core.override
  MoveFilesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MoveFilesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MoveFilesResponse>(create);
  static MoveFilesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

class GetFileURLRequest extends $pb.GeneratedMessage {
  factory GetFileURLRequest({
    $core.String? accountId,
    $core.String? uri,
    $core.bool? download,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (uri != null) result.uri = uri;
    if (download != null) result.download = download;
    return result;
  }

  GetFileURLRequest._();

  factory GetFileURLRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFileURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFileURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'uri')
    ..aOB(3, _omitFieldNames ? '' : 'download')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFileURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFileURLRequest copyWith(void Function(GetFileURLRequest) updates) =>
      super.copyWith((message) => updates(message as GetFileURLRequest))
          as GetFileURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileURLRequest create() => GetFileURLRequest._();
  @$core.override
  GetFileURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetFileURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFileURLRequest>(create);
  static GetFileURLRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uri => $_getSZ(1);
  @$pb.TagNumber(2)
  set uri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearUri() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get download => $_getBF(2);
  @$pb.TagNumber(3)
  set download($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDownload() => $_has(2);
  @$pb.TagNumber(3)
  void clearDownload() => $_clearField(3);
}

class FileURLResponse extends $pb.GeneratedMessage {
  factory FileURLResponse({
    $core.String? url,
    $core.String? name,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (name != null) result.name = name;
    return result;
  }

  FileURLResponse._();

  factory FileURLResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileURLResponse copyWith(void Function(FileURLResponse) updates) =>
      super.copyWith((message) => updates(message as FileURLResponse))
          as FileURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileURLResponse create() => FileURLResponse._();
  @$core.override
  FileURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileURLResponse>(create);
  static FileURLResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class GetDirectLinkRequest extends $pb.GeneratedMessage {
  factory GetDirectLinkRequest({
    $core.String? accountId,
    $core.Iterable<$core.String>? uris,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (uris != null) result.uris.addAll(uris);
    return result;
  }

  GetDirectLinkRequest._();

  factory GetDirectLinkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDirectLinkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDirectLinkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..pPS(2, _omitFieldNames ? '' : 'uris')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectLinkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectLinkRequest copyWith(void Function(GetDirectLinkRequest) updates) =>
      super.copyWith((message) => updates(message as GetDirectLinkRequest))
          as GetDirectLinkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDirectLinkRequest create() => GetDirectLinkRequest._();
  @$core.override
  GetDirectLinkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDirectLinkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDirectLinkRequest>(create);
  static GetDirectLinkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get uris => $_getList(1);
}

class DirectLinkResponse extends $pb.GeneratedMessage {
  factory DirectLinkResponse({
    $core.Iterable<DirectLink>? links,
  }) {
    final result = create();
    if (links != null) result.links.addAll(links);
    return result;
  }

  DirectLinkResponse._();

  factory DirectLinkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectLinkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectLinkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPM<DirectLink>(1, _omitFieldNames ? '' : 'links',
        subBuilder: DirectLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectLinkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectLinkResponse copyWith(void Function(DirectLinkResponse) updates) =>
      super.copyWith((message) => updates(message as DirectLinkResponse))
          as DirectLinkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectLinkResponse create() => DirectLinkResponse._();
  @$core.override
  DirectLinkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectLinkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectLinkResponse>(create);
  static DirectLinkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DirectLink> get links => $_getList(0);
}

class DirectLink extends $pb.GeneratedMessage {
  factory DirectLink({
    $core.String? id,
    $core.String? name,
    $core.String? source,
    $core.bool? enabled,
    $core.String? createdAt,
    $fixnum.Int64? views,
    $fixnum.Int64? downloads,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (source != null) result.source = source;
    if (enabled != null) result.enabled = enabled;
    if (createdAt != null) result.createdAt = createdAt;
    if (views != null) result.views = views;
    if (downloads != null) result.downloads = downloads;
    return result;
  }

  DirectLink._();

  factory DirectLink.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectLink.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectLink',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'source')
    ..aOB(4, _omitFieldNames ? '' : 'enabled')
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(6, _omitFieldNames ? '' : 'views')
    ..aInt64(7, _omitFieldNames ? '' : 'downloads')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectLink clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectLink copyWith(void Function(DirectLink) updates) =>
      super.copyWith((message) => updates(message as DirectLink)) as DirectLink;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectLink create() => DirectLink._();
  @$core.override
  DirectLink createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectLink getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectLink>(create);
  static DirectLink? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get source => $_getSZ(2);
  @$pb.TagNumber(3)
  set source($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSource() => $_has(2);
  @$pb.TagNumber(3)
  void clearSource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get enabled => $_getBF(3);
  @$pb.TagNumber(4)
  set enabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get views => $_getI64(5);
  @$pb.TagNumber(6)
  set views($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasViews() => $_has(5);
  @$pb.TagNumber(6)
  void clearViews() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get downloads => $_getI64(6);
  @$pb.TagNumber(7)
  set downloads($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDownloads() => $_has(6);
  @$pb.TagNumber(7)
  void clearDownloads() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
