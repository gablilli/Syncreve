// This is a generated file - do not edit.
//
// Generated from file_service.proto.

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

import 'file_service.pb.dart' as $0;

export 'file_service.pb.dart';

/// FileService provides file management operations
@$pb.GrpcServiceName('syncreve.FileService')
class FileServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FileServiceClient(super.channel, {super.options, super.interceptors});

  /// List files in a directory
  $grpc.ResponseFuture<$0.ListFilesResponse> listFiles(
    $0.ListFilesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listFiles, request, options: options);
  }

  /// Get file information
  $grpc.ResponseFuture<$0.FileInfoResponse> getFileInfo(
    $0.GetFileInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFileInfo, request, options: options);
  }

  /// Create a file or folder
  $grpc.ResponseFuture<$0.FileInfoResponse> createFile(
    $0.CreateFileRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createFile, request, options: options);
  }

  /// Delete files
  $grpc.ResponseFuture<$0.DeleteFilesResponse> deleteFiles(
    $0.DeleteFilesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteFiles, request, options: options);
  }

  /// Rename a file
  $grpc.ResponseFuture<$0.FileInfoResponse> renameFile(
    $0.RenameFileRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$renameFile, request, options: options);
  }

  /// Move files
  $grpc.ResponseFuture<$0.MoveFilesResponse> moveFiles(
    $0.MoveFilesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$moveFiles, request, options: options);
  }

  /// Get file download URL
  $grpc.ResponseFuture<$0.FileURLResponse> getFileURL(
    $0.GetFileURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFileURL, request, options: options);
  }

  /// Get direct download link
  $grpc.ResponseFuture<$0.DirectLinkResponse> getDirectLink(
    $0.GetDirectLinkRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDirectLink, request, options: options);
  }

  // method descriptors

  static final _$listFiles =
      $grpc.ClientMethod<$0.ListFilesRequest, $0.ListFilesResponse>(
          '/syncreve.FileService/ListFiles',
          ($0.ListFilesRequest value) => value.writeToBuffer(),
          $0.ListFilesResponse.fromBuffer);
  static final _$getFileInfo =
      $grpc.ClientMethod<$0.GetFileInfoRequest, $0.FileInfoResponse>(
          '/syncreve.FileService/GetFileInfo',
          ($0.GetFileInfoRequest value) => value.writeToBuffer(),
          $0.FileInfoResponse.fromBuffer);
  static final _$createFile =
      $grpc.ClientMethod<$0.CreateFileRequest, $0.FileInfoResponse>(
          '/syncreve.FileService/CreateFile',
          ($0.CreateFileRequest value) => value.writeToBuffer(),
          $0.FileInfoResponse.fromBuffer);
  static final _$deleteFiles =
      $grpc.ClientMethod<$0.DeleteFilesRequest, $0.DeleteFilesResponse>(
          '/syncreve.FileService/DeleteFiles',
          ($0.DeleteFilesRequest value) => value.writeToBuffer(),
          $0.DeleteFilesResponse.fromBuffer);
  static final _$renameFile =
      $grpc.ClientMethod<$0.RenameFileRequest, $0.FileInfoResponse>(
          '/syncreve.FileService/RenameFile',
          ($0.RenameFileRequest value) => value.writeToBuffer(),
          $0.FileInfoResponse.fromBuffer);
  static final _$moveFiles =
      $grpc.ClientMethod<$0.MoveFilesRequest, $0.MoveFilesResponse>(
          '/syncreve.FileService/MoveFiles',
          ($0.MoveFilesRequest value) => value.writeToBuffer(),
          $0.MoveFilesResponse.fromBuffer);
  static final _$getFileURL =
      $grpc.ClientMethod<$0.GetFileURLRequest, $0.FileURLResponse>(
          '/syncreve.FileService/GetFileURL',
          ($0.GetFileURLRequest value) => value.writeToBuffer(),
          $0.FileURLResponse.fromBuffer);
  static final _$getDirectLink =
      $grpc.ClientMethod<$0.GetDirectLinkRequest, $0.DirectLinkResponse>(
          '/syncreve.FileService/GetDirectLink',
          ($0.GetDirectLinkRequest value) => value.writeToBuffer(),
          $0.DirectLinkResponse.fromBuffer);
}

@$pb.GrpcServiceName('syncreve.FileService')
abstract class FileServiceBase extends $grpc.Service {
  $core.String get $name => 'syncreve.FileService';

  FileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListFilesRequest, $0.ListFilesResponse>(
        'ListFiles',
        listFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListFilesRequest.fromBuffer(value),
        ($0.ListFilesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFileInfoRequest, $0.FileInfoResponse>(
        'GetFileInfo',
        getFileInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetFileInfoRequest.fromBuffer(value),
        ($0.FileInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateFileRequest, $0.FileInfoResponse>(
        'CreateFile',
        createFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateFileRequest.fromBuffer(value),
        ($0.FileInfoResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteFilesRequest, $0.DeleteFilesResponse>(
            'DeleteFiles',
            deleteFiles_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteFilesRequest.fromBuffer(value),
            ($0.DeleteFilesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameFileRequest, $0.FileInfoResponse>(
        'RenameFile',
        renameFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RenameFileRequest.fromBuffer(value),
        ($0.FileInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveFilesRequest, $0.MoveFilesResponse>(
        'MoveFiles',
        moveFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveFilesRequest.fromBuffer(value),
        ($0.MoveFilesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFileURLRequest, $0.FileURLResponse>(
        'GetFileURL',
        getFileURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFileURLRequest.fromBuffer(value),
        ($0.FileURLResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetDirectLinkRequest, $0.DirectLinkResponse>(
            'GetDirectLink',
            getDirectLink_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetDirectLinkRequest.fromBuffer(value),
            ($0.DirectLinkResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListFilesResponse> listFiles_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListFilesRequest> $request) async {
    return listFiles($call, await $request);
  }

  $async.Future<$0.ListFilesResponse> listFiles(
      $grpc.ServiceCall call, $0.ListFilesRequest request);

  $async.Future<$0.FileInfoResponse> getFileInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetFileInfoRequest> $request) async {
    return getFileInfo($call, await $request);
  }

  $async.Future<$0.FileInfoResponse> getFileInfo(
      $grpc.ServiceCall call, $0.GetFileInfoRequest request);

  $async.Future<$0.FileInfoResponse> createFile_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateFileRequest> $request) async {
    return createFile($call, await $request);
  }

  $async.Future<$0.FileInfoResponse> createFile(
      $grpc.ServiceCall call, $0.CreateFileRequest request);

  $async.Future<$0.DeleteFilesResponse> deleteFiles_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteFilesRequest> $request) async {
    return deleteFiles($call, await $request);
  }

  $async.Future<$0.DeleteFilesResponse> deleteFiles(
      $grpc.ServiceCall call, $0.DeleteFilesRequest request);

  $async.Future<$0.FileInfoResponse> renameFile_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RenameFileRequest> $request) async {
    return renameFile($call, await $request);
  }

  $async.Future<$0.FileInfoResponse> renameFile(
      $grpc.ServiceCall call, $0.RenameFileRequest request);

  $async.Future<$0.MoveFilesResponse> moveFiles_Pre($grpc.ServiceCall $call,
      $async.Future<$0.MoveFilesRequest> $request) async {
    return moveFiles($call, await $request);
  }

  $async.Future<$0.MoveFilesResponse> moveFiles(
      $grpc.ServiceCall call, $0.MoveFilesRequest request);

  $async.Future<$0.FileURLResponse> getFileURL_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetFileURLRequest> $request) async {
    return getFileURL($call, await $request);
  }

  $async.Future<$0.FileURLResponse> getFileURL(
      $grpc.ServiceCall call, $0.GetFileURLRequest request);

  $async.Future<$0.DirectLinkResponse> getDirectLink_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetDirectLinkRequest> $request) async {
    return getDirectLink($call, await $request);
  }

  $async.Future<$0.DirectLinkResponse> getDirectLink(
      $grpc.ServiceCall call, $0.GetDirectLinkRequest request);
}
