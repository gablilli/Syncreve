// This is a generated file - do not edit.
//
// Generated from auth_service.proto.

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

/// Account Management Messages
class CreateAccountRequest extends $pb.GeneratedMessage {
  factory CreateAccountRequest({
    $core.String? name,
    $core.String? serverUrl,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (serverUrl != null) result.serverUrl = serverUrl;
    return result;
  }

  CreateAccountRequest._();

  factory CreateAccountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAccountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAccountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'serverUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountRequest copyWith(void Function(CreateAccountRequest) updates) =>
      super.copyWith((message) => updates(message as CreateAccountRequest))
          as CreateAccountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest create() => CreateAccountRequest._();
  @$core.override
  CreateAccountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAccountRequest>(create);
  static CreateAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServerUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerUrl() => $_clearField(2);
}

class CreateAccountResponse extends $pb.GeneratedMessage {
  factory CreateAccountResponse({
    $core.bool? success,
    $core.String? error,
    AccountInfo? account,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (account != null) result.account = account;
    return result;
  }

  CreateAccountResponse._();

  factory CreateAccountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAccountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAccountResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOM<AccountInfo>(3, _omitFieldNames ? '' : 'account',
        subBuilder: AccountInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountResponse copyWith(
          void Function(CreateAccountResponse) updates) =>
      super.copyWith((message) => updates(message as CreateAccountResponse))
          as CreateAccountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccountResponse create() => CreateAccountResponse._();
  @$core.override
  CreateAccountResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAccountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAccountResponse>(create);
  static CreateAccountResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  AccountInfo get account => $_getN(2);
  @$pb.TagNumber(3)
  set account(AccountInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => $_clearField(3);
  @$pb.TagNumber(3)
  AccountInfo ensureAccount() => $_ensure(2);
}

class ListAccountsRequest extends $pb.GeneratedMessage {
  factory ListAccountsRequest() => create();

  ListAccountsRequest._();

  factory ListAccountsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAccountsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAccountsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAccountsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAccountsRequest copyWith(void Function(ListAccountsRequest) updates) =>
      super.copyWith((message) => updates(message as ListAccountsRequest))
          as ListAccountsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountsRequest create() => ListAccountsRequest._();
  @$core.override
  ListAccountsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAccountsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAccountsRequest>(create);
  static ListAccountsRequest? _defaultInstance;
}

class ListAccountsResponse extends $pb.GeneratedMessage {
  factory ListAccountsResponse({
    $core.Iterable<AccountInfo>? accounts,
  }) {
    final result = create();
    if (accounts != null) result.accounts.addAll(accounts);
    return result;
  }

  ListAccountsResponse._();

  factory ListAccountsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAccountsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAccountsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..pPM<AccountInfo>(1, _omitFieldNames ? '' : 'accounts',
        subBuilder: AccountInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAccountsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAccountsResponse copyWith(void Function(ListAccountsResponse) updates) =>
      super.copyWith((message) => updates(message as ListAccountsResponse))
          as ListAccountsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountsResponse create() => ListAccountsResponse._();
  @$core.override
  ListAccountsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAccountsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAccountsResponse>(create);
  static ListAccountsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AccountInfo> get accounts => $_getList(0);
}

class GetAccountRequest extends $pb.GeneratedMessage {
  factory GetAccountRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  GetAccountRequest._();

  factory GetAccountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAccountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAccountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAccountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAccountRequest copyWith(void Function(GetAccountRequest) updates) =>
      super.copyWith((message) => updates(message as GetAccountRequest))
          as GetAccountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountRequest create() => GetAccountRequest._();
  @$core.override
  GetAccountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetAccountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAccountRequest>(create);
  static GetAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class GetAccountResponse extends $pb.GeneratedMessage {
  factory GetAccountResponse({
    $core.bool? success,
    $core.String? error,
    AccountInfo? account,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (account != null) result.account = account;
    return result;
  }

  GetAccountResponse._();

  factory GetAccountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAccountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAccountResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOM<AccountInfo>(3, _omitFieldNames ? '' : 'account',
        subBuilder: AccountInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAccountResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAccountResponse copyWith(void Function(GetAccountResponse) updates) =>
      super.copyWith((message) => updates(message as GetAccountResponse))
          as GetAccountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountResponse create() => GetAccountResponse._();
  @$core.override
  GetAccountResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetAccountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAccountResponse>(create);
  static GetAccountResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  AccountInfo get account => $_getN(2);
  @$pb.TagNumber(3)
  set account(AccountInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => $_clearField(3);
  @$pb.TagNumber(3)
  AccountInfo ensureAccount() => $_ensure(2);
}

class DeleteAccountRequest extends $pb.GeneratedMessage {
  factory DeleteAccountRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  DeleteAccountRequest._();

  factory DeleteAccountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAccountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAccountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccountRequest copyWith(void Function(DeleteAccountRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteAccountRequest))
          as DeleteAccountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccountRequest create() => DeleteAccountRequest._();
  @$core.override
  DeleteAccountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAccountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAccountRequest>(create);
  static DeleteAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class DeleteAccountResponse extends $pb.GeneratedMessage {
  factory DeleteAccountResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  DeleteAccountResponse._();

  factory DeleteAccountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAccountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAccountResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccountResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccountResponse copyWith(
          void Function(DeleteAccountResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteAccountResponse))
          as DeleteAccountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccountResponse create() => DeleteAccountResponse._();
  @$core.override
  DeleteAccountResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAccountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAccountResponse>(create);
  static DeleteAccountResponse? _defaultInstance;

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

class SetActiveAccountRequest extends $pb.GeneratedMessage {
  factory SetActiveAccountRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  SetActiveAccountRequest._();

  factory SetActiveAccountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetActiveAccountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetActiveAccountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetActiveAccountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetActiveAccountRequest copyWith(
          void Function(SetActiveAccountRequest) updates) =>
      super.copyWith((message) => updates(message as SetActiveAccountRequest))
          as SetActiveAccountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetActiveAccountRequest create() => SetActiveAccountRequest._();
  @$core.override
  SetActiveAccountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetActiveAccountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetActiveAccountRequest>(create);
  static SetActiveAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class SetActiveAccountResponse extends $pb.GeneratedMessage {
  factory SetActiveAccountResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  SetActiveAccountResponse._();

  factory SetActiveAccountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetActiveAccountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetActiveAccountResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetActiveAccountResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetActiveAccountResponse copyWith(
          void Function(SetActiveAccountResponse) updates) =>
      super.copyWith((message) => updates(message as SetActiveAccountResponse))
          as SetActiveAccountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetActiveAccountResponse create() => SetActiveAccountResponse._();
  @$core.override
  SetActiveAccountResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetActiveAccountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetActiveAccountResponse>(create);
  static SetActiveAccountResponse? _defaultInstance;

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

class GetActiveAccountRequest extends $pb.GeneratedMessage {
  factory GetActiveAccountRequest() => create();

  GetActiveAccountRequest._();

  factory GetActiveAccountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetActiveAccountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetActiveAccountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetActiveAccountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetActiveAccountRequest copyWith(
          void Function(GetActiveAccountRequest) updates) =>
      super.copyWith((message) => updates(message as GetActiveAccountRequest))
          as GetActiveAccountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActiveAccountRequest create() => GetActiveAccountRequest._();
  @$core.override
  GetActiveAccountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetActiveAccountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetActiveAccountRequest>(create);
  static GetActiveAccountRequest? _defaultInstance;
}

class GetActiveAccountResponse extends $pb.GeneratedMessage {
  factory GetActiveAccountResponse({
    $core.bool? success,
    $core.String? error,
    AccountInfo? account,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (account != null) result.account = account;
    return result;
  }

  GetActiveAccountResponse._();

  factory GetActiveAccountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetActiveAccountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetActiveAccountResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOM<AccountInfo>(3, _omitFieldNames ? '' : 'account',
        subBuilder: AccountInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetActiveAccountResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetActiveAccountResponse copyWith(
          void Function(GetActiveAccountResponse) updates) =>
      super.copyWith((message) => updates(message as GetActiveAccountResponse))
          as GetActiveAccountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActiveAccountResponse create() => GetActiveAccountResponse._();
  @$core.override
  GetActiveAccountResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetActiveAccountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetActiveAccountResponse>(create);
  static GetActiveAccountResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  AccountInfo get account => $_getN(2);
  @$pb.TagNumber(3)
  set account(AccountInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => $_clearField(3);
  @$pb.TagNumber(3)
  AccountInfo ensureAccount() => $_ensure(2);
}

class AccountInfo extends $pb.GeneratedMessage {
  factory AccountInfo({
    $core.String? id,
    $core.String? name,
    $core.String? serverUrl,
    $core.bool? isActive,
    $core.bool? isAuthenticated,
    $core.String? email,
    $core.String? userId,
    $core.String? lastLoginAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (serverUrl != null) result.serverUrl = serverUrl;
    if (isActive != null) result.isActive = isActive;
    if (isAuthenticated != null) result.isAuthenticated = isAuthenticated;
    if (email != null) result.email = email;
    if (userId != null) result.userId = userId;
    if (lastLoginAt != null) result.lastLoginAt = lastLoginAt;
    return result;
  }

  AccountInfo._();

  factory AccountInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'serverUrl')
    ..aOB(4, _omitFieldNames ? '' : 'isActive')
    ..aOB(5, _omitFieldNames ? '' : 'isAuthenticated')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'userId')
    ..aOS(8, _omitFieldNames ? '' : 'lastLoginAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountInfo copyWith(void Function(AccountInfo) updates) =>
      super.copyWith((message) => updates(message as AccountInfo))
          as AccountInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountInfo create() => AccountInfo._();
  @$core.override
  AccountInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfo>(create);
  static AccountInfo? _defaultInstance;

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
  $core.String get serverUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set serverUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActive => $_getBF(3);
  @$pb.TagNumber(4)
  set isActive($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAuthenticated => $_getBF(4);
  @$pb.TagNumber(5)
  set isAuthenticated($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsAuthenticated() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAuthenticated() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get userId => $_getSZ(6);
  @$pb.TagNumber(7)
  set userId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastLoginAt => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastLoginAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastLoginAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastLoginAt() => $_clearField(8);
}

/// Authentication Messages
class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? accountId,
    $core.String? email,
    $core.String? password,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    return result;
  }

  LoginRequest._();

  factory LoginRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest copyWith(void Function(LoginRequest) updates) =>
      super.copyWith((message) => updates(message as LoginRequest))
          as LoginRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  @$core.override
  LoginRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);
}

class Login2FARequest extends $pb.GeneratedMessage {
  factory Login2FARequest({
    $core.String? accountId,
    $core.String? code,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (code != null) result.code = code;
    return result;
  }

  Login2FARequest._();

  factory Login2FARequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Login2FARequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Login2FARequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Login2FARequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Login2FARequest copyWith(void Function(Login2FARequest) updates) =>
      super.copyWith((message) => updates(message as Login2FARequest))
          as Login2FARequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Login2FARequest create() => Login2FARequest._();
  @$core.override
  Login2FARequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Login2FARequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Login2FARequest>(create);
  static Login2FARequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.bool? success,
    $core.String? error,
    UserInfo? user,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (user != null) result.user = user;
    return result;
  }

  LoginResponse._();

  factory LoginResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOM<UserInfo>(3, _omitFieldNames ? '' : 'user',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse copyWith(void Function(LoginResponse) updates) =>
      super.copyWith((message) => updates(message as LoginResponse))
          as LoginResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  @$core.override
  LoginResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  UserInfo get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(UserInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => $_clearField(3);
  @$pb.TagNumber(3)
  UserInfo ensureUser() => $_ensure(2);
}

class LogoutRequest extends $pb.GeneratedMessage {
  factory LogoutRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  LogoutRequest._();

  factory LogoutRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogoutRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogoutRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutRequest copyWith(void Function(LogoutRequest) updates) =>
      super.copyWith((message) => updates(message as LogoutRequest))
          as LogoutRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  @$core.override
  LogoutRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogoutRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LogoutRequest>(create);
  static LogoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class LogoutResponse extends $pb.GeneratedMessage {
  factory LogoutResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  LogoutResponse._();

  factory LogoutResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogoutResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogoutResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutResponse copyWith(void Function(LogoutResponse) updates) =>
      super.copyWith((message) => updates(message as LogoutResponse))
          as LogoutResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutResponse create() => LogoutResponse._();
  @$core.override
  LogoutResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogoutResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LogoutResponse>(create);
  static LogoutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetUserInfoRequest extends $pb.GeneratedMessage {
  factory GetUserInfoRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  GetUserInfoRequest._();

  factory GetUserInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserInfoRequest copyWith(void Function(GetUserInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetUserInfoRequest))
          as GetUserInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserInfoRequest create() => GetUserInfoRequest._();
  @$core.override
  GetUserInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserInfoRequest>(create);
  static GetUserInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class UserInfoResponse extends $pb.GeneratedMessage {
  factory UserInfoResponse({
    UserInfo? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UserInfoResponse._();

  factory UserInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'user',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoResponse copyWith(void Function(UserInfoResponse) updates) =>
      super.copyWith((message) => updates(message as UserInfoResponse))
          as UserInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoResponse create() => UserInfoResponse._();
  @$core.override
  UserInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoResponse>(create);
  static UserInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserInfo get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureUser() => $_ensure(0);
}

class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? id,
    $core.String? username,
    $core.String? email,
    $core.String? nickname,
    $core.String? avatar,
    $fixnum.Int64? groupId,
    $fixnum.Int64? storageUsed,
    $fixnum.Int64? storageTotal,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (username != null) result.username = username;
    if (email != null) result.email = email;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (groupId != null) result.groupId = groupId;
    if (storageUsed != null) result.storageUsed = storageUsed;
    if (storageTotal != null) result.storageTotal = storageTotal;
    return result;
  }

  UserInfo._();

  factory UserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'nickname')
    ..aOS(5, _omitFieldNames ? '' : 'avatar')
    ..aInt64(6, _omitFieldNames ? '' : 'groupId')
    ..aInt64(7, _omitFieldNames ? '' : 'storageUsed')
    ..aInt64(8, _omitFieldNames ? '' : 'storageTotal')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo copyWith(void Function(UserInfo) updates) =>
      super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  @$core.override
  UserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickname() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get groupId => $_getI64(5);
  @$pb.TagNumber(6)
  set groupId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupId() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get storageUsed => $_getI64(6);
  @$pb.TagNumber(7)
  set storageUsed($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStorageUsed() => $_has(6);
  @$pb.TagNumber(7)
  void clearStorageUsed() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get storageTotal => $_getI64(7);
  @$pb.TagNumber(8)
  set storageTotal($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStorageTotal() => $_has(7);
  @$pb.TagNumber(8)
  void clearStorageTotal() => $_clearField(8);
}

class IsAuthenticatedRequest extends $pb.GeneratedMessage {
  factory IsAuthenticatedRequest({
    $core.String? accountId,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    return result;
  }

  IsAuthenticatedRequest._();

  factory IsAuthenticatedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IsAuthenticatedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IsAuthenticatedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsAuthenticatedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsAuthenticatedRequest copyWith(
          void Function(IsAuthenticatedRequest) updates) =>
      super.copyWith((message) => updates(message as IsAuthenticatedRequest))
          as IsAuthenticatedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsAuthenticatedRequest create() => IsAuthenticatedRequest._();
  @$core.override
  IsAuthenticatedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IsAuthenticatedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IsAuthenticatedRequest>(create);
  static IsAuthenticatedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);
}

class IsAuthenticatedResponse extends $pb.GeneratedMessage {
  factory IsAuthenticatedResponse({
    $core.bool? authenticated,
  }) {
    final result = create();
    if (authenticated != null) result.authenticated = authenticated;
    return result;
  }

  IsAuthenticatedResponse._();

  factory IsAuthenticatedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IsAuthenticatedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IsAuthenticatedResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'syncreve'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'authenticated')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsAuthenticatedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsAuthenticatedResponse copyWith(
          void Function(IsAuthenticatedResponse) updates) =>
      super.copyWith((message) => updates(message as IsAuthenticatedResponse))
          as IsAuthenticatedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsAuthenticatedResponse create() => IsAuthenticatedResponse._();
  @$core.override
  IsAuthenticatedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IsAuthenticatedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IsAuthenticatedResponse>(create);
  static IsAuthenticatedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get authenticated => $_getBF(0);
  @$pb.TagNumber(1)
  set authenticated($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthenticated() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenticated() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
