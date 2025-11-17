import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncreve/providers/app_provider.dart';
import 'package:syncreve/providers/account_provider.dart';
import 'package:syncreve/ui/setup_screen.dart';
import 'package:syncreve/ui/home_screen.dart';

/// Splash Screen - 启动页面
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // 等待动画完成
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    try {
      // 尝试连接到服务
      await ref.read(appProvider.notifier).connect();

      if (!mounted) return;

      // 等待 providers 初始化
      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      // 检查是否有账户
      final accountState = ref.read(accountManagerProvider);
      final hasAccount = accountState.accounts.isNotEmpty;

      // 导航到对应页面
      if (hasAccount && accountState.currentAccount != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SetupScreen()));
      }
    } catch (e) {
      if (!mounted) return;
      _showError('Service connection failed: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'app_logo',
          child: Icon(Icons.cloud_circle, color: Colors.indigoAccent, size: 168),
        ),
      ),
    );
  }
}
