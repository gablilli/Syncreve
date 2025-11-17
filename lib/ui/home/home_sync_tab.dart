import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home Sync Tab - 同步管理标签页
class HomeSyncTab extends ConsumerWidget {
  const HomeSyncTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sync')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sync, size: 120, color: Theme.of(context).primaryColor.withOpacity(0.3)),
            const SizedBox(height: 32),
            Text(
              '敬请期待',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Coming Soon',
              style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6)),
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '同步功能正在开发中\nSync feature is under development',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
