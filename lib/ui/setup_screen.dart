import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncreve/ui/qr_scanner_screen.dart';
import 'package:syncreve/providers/account_provider.dart';
import 'package:syncreve/ui/home_screen.dart';

/// Setup Screen - 账户设置页面
class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  final _urlController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _onEnterUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _showError('Please enter a valid URL');
      return;
    }

    // 简单的 URL 验证
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      _showError('URL must start with http:// or https://');
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 创建账户
      final accountName = Uri.parse(url).host;
      await ref.read(accountManagerProvider.notifier).createAccount(name: accountName, serverUrl: url);

      if (!mounted) return;

      // 成功后导航到主页
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account created successfully')));

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    } catch (e) {
      if (!mounted) return;
      _showError('Failed to create account: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _onScanQR() async {
    final result = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (_) => const QRScannerScreen()));

    if (result != null && result.isNotEmpty) {
      _urlController.text = result;
      _onEnterUrl();
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncreve Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // 服务器 URL 输入卡片
            Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Hero(
                        tag: 'app_logo',
                        child: Icon(Icons.cloud_circle, color: Colors.indigoAccent, size: 120),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        labelText: 'Cloudreve Instance URL',
                        hintText: 'https://example.com',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.link),
                      ),
                      keyboardType: TextInputType.url,
                      enabled: !_isLoading,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 操作按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 确认按钮
                FloatingActionButton(
                  heroTag: 'enter_button',
                  onPressed: _isLoading ? null : _onEnterUrl,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.chevron_right),
                ),
                const SizedBox(width: 24),
                const Text('or'),
                const SizedBox(width: 24),
                // 扫码按钮
                FloatingActionButton(
                  heroTag: 'scan_button',
                  onPressed: _isLoading ? null : _onScanQR,
                  child: const Icon(Icons.qr_code_scanner),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
