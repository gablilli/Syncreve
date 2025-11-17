// This is a generated file - do not edit.
//
// Generated from auth_service.proto.

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

import 'auth_service.pb.dart' as $0;

export 'auth_service.pb.dart';

/// AuthService provides authentication operations and account management
@$pb.GrpcServiceName('syncreve.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  /// Account Management
  $grpc.ResponseFuture<$0.CreateAccountResponse> createAccount(
    $0.CreateAccountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListAccountsResponse> listAccounts(
    $0.ListAccountsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listAccounts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAccountResponse> getAccount(
    $0.GetAccountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteAccountResponse> deleteAccount(
    $0.DeleteAccountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetActiveAccountResponse> setActiveAccount(
    $0.SetActiveAccountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setActiveAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetActiveAccountResponse> getActiveAccount(
    $0.GetActiveAccountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getActiveAccount, request, options: options);
  }

  /// Authentication (requires account_id)
  $grpc.ResponseFuture<$0.LoginResponse> login(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login2FA(
    $0.Login2FARequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login2FA, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout(
    $0.LogoutRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  /// User Info (requires account_id)
  $grpc.ResponseFuture<$0.UserInfoResponse> getUserInfo(
    $0.GetUserInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.IsAuthenticatedResponse> isAuthenticated(
    $0.IsAuthenticatedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$isAuthenticated, request, options: options);
  }

  // method descriptors

  static final _$createAccount =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
          '/syncreve.AuthService/CreateAccount',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          $0.CreateAccountResponse.fromBuffer);
  static final _$listAccounts =
      $grpc.ClientMethod<$0.ListAccountsRequest, $0.ListAccountsResponse>(
          '/syncreve.AuthService/ListAccounts',
          ($0.ListAccountsRequest value) => value.writeToBuffer(),
          $0.ListAccountsResponse.fromBuffer);
  static final _$getAccount =
      $grpc.ClientMethod<$0.GetAccountRequest, $0.GetAccountResponse>(
          '/syncreve.AuthService/GetAccount',
          ($0.GetAccountRequest value) => value.writeToBuffer(),
          $0.GetAccountResponse.fromBuffer);
  static final _$deleteAccount =
      $grpc.ClientMethod<$0.DeleteAccountRequest, $0.DeleteAccountResponse>(
          '/syncreve.AuthService/DeleteAccount',
          ($0.DeleteAccountRequest value) => value.writeToBuffer(),
          $0.DeleteAccountResponse.fromBuffer);
  static final _$setActiveAccount = $grpc.ClientMethod<
          $0.SetActiveAccountRequest, $0.SetActiveAccountResponse>(
      '/syncreve.AuthService/SetActiveAccount',
      ($0.SetActiveAccountRequest value) => value.writeToBuffer(),
      $0.SetActiveAccountResponse.fromBuffer);
  static final _$getActiveAccount = $grpc.ClientMethod<
          $0.GetActiveAccountRequest, $0.GetActiveAccountResponse>(
      '/syncreve.AuthService/GetActiveAccount',
      ($0.GetActiveAccountRequest value) => value.writeToBuffer(),
      $0.GetActiveAccountResponse.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/syncreve.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $0.LoginResponse.fromBuffer);
  static final _$login2FA =
      $grpc.ClientMethod<$0.Login2FARequest, $0.LoginResponse>(
          '/syncreve.AuthService/Login2FA',
          ($0.Login2FARequest value) => value.writeToBuffer(),
          $0.LoginResponse.fromBuffer);
  static final _$logout =
      $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
          '/syncreve.AuthService/Logout',
          ($0.LogoutRequest value) => value.writeToBuffer(),
          $0.LogoutResponse.fromBuffer);
  static final _$getUserInfo =
      $grpc.ClientMethod<$0.GetUserInfoRequest, $0.UserInfoResponse>(
          '/syncreve.AuthService/GetUserInfo',
          ($0.GetUserInfoRequest value) => value.writeToBuffer(),
          $0.UserInfoResponse.fromBuffer);
  static final _$isAuthenticated =
      $grpc.ClientMethod<$0.IsAuthenticatedRequest, $0.IsAuthenticatedResponse>(
          '/syncreve.AuthService/IsAuthenticated',
          ($0.IsAuthenticatedRequest value) => value.writeToBuffer(),
          $0.IsAuthenticatedResponse.fromBuffer);
}

@$pb.GrpcServiceName('syncreve.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'syncreve.AuthService';

  AuthServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
            'CreateAccount',
            createAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateAccountRequest.fromBuffer(value),
            ($0.CreateAccountResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListAccountsRequest, $0.ListAccountsResponse>(
            'ListAccounts',
            listAccounts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListAccountsRequest.fromBuffer(value),
            ($0.ListAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAccountRequest, $0.GetAccountResponse>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAccountRequest.fromBuffer(value),
        ($0.GetAccountResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteAccountRequest, $0.DeleteAccountResponse>(
            'DeleteAccount',
            deleteAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteAccountRequest.fromBuffer(value),
            ($0.DeleteAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetActiveAccountRequest,
            $0.SetActiveAccountResponse>(
        'SetActiveAccount',
        setActiveAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetActiveAccountRequest.fromBuffer(value),
        ($0.SetActiveAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetActiveAccountRequest,
            $0.GetActiveAccountResponse>(
        'GetActiveAccount',
        getActiveAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetActiveAccountRequest.fromBuffer(value),
        ($0.GetActiveAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Login2FARequest, $0.LoginResponse>(
        'Login2FA',
        login2FA_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Login2FARequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LogoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserInfoRequest, $0.UserInfoResponse>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUserInfoRequest.fromBuffer(value),
        ($0.UserInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IsAuthenticatedRequest,
            $0.IsAuthenticatedResponse>(
        'IsAuthenticated',
        isAuthenticated_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IsAuthenticatedRequest.fromBuffer(value),
        ($0.IsAuthenticatedResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateAccountResponse> createAccount_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateAccountRequest> $request) async {
    return createAccount($call, await $request);
  }

  $async.Future<$0.CreateAccountResponse> createAccount(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);

  $async.Future<$0.ListAccountsResponse> listAccounts_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListAccountsRequest> $request) async {
    return listAccounts($call, await $request);
  }

  $async.Future<$0.ListAccountsResponse> listAccounts(
      $grpc.ServiceCall call, $0.ListAccountsRequest request);

  $async.Future<$0.GetAccountResponse> getAccount_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetAccountRequest> $request) async {
    return getAccount($call, await $request);
  }

  $async.Future<$0.GetAccountResponse> getAccount(
      $grpc.ServiceCall call, $0.GetAccountRequest request);

  $async.Future<$0.DeleteAccountResponse> deleteAccount_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteAccountRequest> $request) async {
    return deleteAccount($call, await $request);
  }

  $async.Future<$0.DeleteAccountResponse> deleteAccount(
      $grpc.ServiceCall call, $0.DeleteAccountRequest request);

  $async.Future<$0.SetActiveAccountResponse> setActiveAccount_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SetActiveAccountRequest> $request) async {
    return setActiveAccount($call, await $request);
  }

  $async.Future<$0.SetActiveAccountResponse> setActiveAccount(
      $grpc.ServiceCall call, $0.SetActiveAccountRequest request);

  $async.Future<$0.GetActiveAccountResponse> getActiveAccount_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetActiveAccountRequest> $request) async {
    return getActiveAccount($call, await $request);
  }

  $async.Future<$0.GetActiveAccountResponse> getActiveAccount(
      $grpc.ServiceCall call, $0.GetActiveAccountRequest request);

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$0.LoginResponse> login2FA_Pre($grpc.ServiceCall $call,
      $async.Future<$0.Login2FARequest> $request) async {
    return login2FA($call, await $request);
  }

  $async.Future<$0.LoginResponse> login2FA(
      $grpc.ServiceCall call, $0.Login2FARequest request);

  $async.Future<$0.LogoutResponse> logout_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LogoutRequest> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$0.LogoutResponse> logout(
      $grpc.ServiceCall call, $0.LogoutRequest request);

  $async.Future<$0.UserInfoResponse> getUserInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetUserInfoRequest> $request) async {
    return getUserInfo($call, await $request);
  }

  $async.Future<$0.UserInfoResponse> getUserInfo(
      $grpc.ServiceCall call, $0.GetUserInfoRequest request);

  $async.Future<$0.IsAuthenticatedResponse> isAuthenticated_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.IsAuthenticatedRequest> $request) async {
    return isAuthenticated($call, await $request);
  }

  $async.Future<$0.IsAuthenticatedResponse> isAuthenticated(
      $grpc.ServiceCall call, $0.IsAuthenticatedRequest request);
}
