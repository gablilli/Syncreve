import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

/// gRPC 连接状态
enum ConnectionStatus { disconnected, connecting, connected, error }

/// App 状态 - 管理 gRPC 连接
@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    @Default(ConnectionStatus.disconnected) ConnectionStatus status,
    String? socketPath,
    int? port,
    String? errorMessage,
    Directory? appSupportDir,
  }) = _AppState;

  const AppState._();

  bool get isConnected => status == ConnectionStatus.connected;
  bool get isConnecting => status == ConnectionStatus.connecting;
  bool get hasError => status == ConnectionStatus.error;
}
