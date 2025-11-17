import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncreve/common/channel/app_service_channel.dart';
import '../models/app_state.dart';
import '../generated/grpc/ping_service.pbgrpc.dart';

part 'app_provider.g.dart';

/// App Provider - 管理 gRPC 连接状态
@riverpod
class App extends _$App {
  ClientChannel? _channel;

  @override
  AppState build() {
    ref.onDispose(() {
      _channel?.shutdown();
    });

    return const AppState();
  }

  /// 初始化并连接到 gRPC 服务器
  Future<void> connect() async {
    state = state.copyWith(status: ConnectionStatus.connecting);

    try {
      final supportDir = await getApplicationSupportDirectory();
      if (Platform.isAndroid || Platform.isIOS) {
        final workingDir = Directory('${supportDir.path}/syncreve_service');
        await AppServiceChannel.startService(workingDir.path);
        // 等待服务启动
        await Future.delayed(Duration(seconds: 1));
        // 移动平台使用 Unix socket
        final socketPath = '${workingDir.path}/syncreve.sock';

        _channel = ClientChannel(
          InternetAddress(socketPath, type: InternetAddressType.unix),
          port: 0,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

        state = state.copyWith(status: ConnectionStatus.connected, socketPath: socketPath);
      } else {
        // 桌面平台使用 TCP
        final port = 52123; // 默认端口

        _channel = ClientChannel(
          'localhost',
          port: port,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

        state = state.copyWith(status: ConnectionStatus.connected, port: port, appSupportDir: supportDir);
      }

      // 测试连接
      await _testConnection();
    } catch (e) {
      state = state.copyWith(status: ConnectionStatus.error, errorMessage: e.toString());
      rethrow;
    }
  }

  /// 断开连接
  Future<void> disconnect() async {
    await _channel?.shutdown();
    _channel = null;
    state = const AppState(status: ConnectionStatus.disconnected);
  }

  /// 获取 gRPC channel
  ClientChannel? get channel => _channel;

  /// 测试连接
  Future<void> _testConnection() async {
    if (_channel == null) {
      throw Exception('Channel not initialized');
    }

    final client = PingServiceClient(_channel!);
    await client.ping(PingRequest(message: 'test'));
  }
}
