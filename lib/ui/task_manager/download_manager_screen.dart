import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filesize/filesize.dart';
import 'package:syncreve/providers/download_service_provider.dart';
import 'package:syncreve/generated/grpc/download_service.pb.dart';

/// Download Manager Screen - 下载管理页面
class DownloadManagerScreen extends ConsumerStatefulWidget {
  const DownloadManagerScreen({super.key});

  @override
  ConsumerState<DownloadManagerScreen> createState() => _DownloadManagerScreenState();
}

class _DownloadManagerScreenState extends ConsumerState<DownloadManagerScreen> {
  ListTasksResponse? _tasksResponse;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    try {
      final response = await ref.read(downloadServiceProvider.notifier).getDownloadTasks();

      if (mounted) {
        setState(() {
          _tasksResponse = response;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load tasks: $e')));
      }
    }
  }

  List<DownloadTaskInfo> get _activeTasks {
    if (_tasksResponse == null) return [];
    return _tasksResponse!.tasks
        .where((t) => t.status == TaskStatus.DOWNLOADING || t.status == TaskStatus.WAITING)
        .toList();
  }

  List<DownloadTaskInfo> get _otherTasks {
    if (_tasksResponse == null) return [];
    return _tasksResponse!.tasks
        .where((t) => t.status != TaskStatus.DOWNLOADING && t.status != TaskStatus.WAITING)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads (${_tasksResponse?.tasks.length ?? 0})'),
        actions: [
          if (_tasksResponse != null && _tasksResponse!.tasks.isNotEmpty)
            TextButton(onPressed: _clearCompleted, child: const Text('Clear Completed')),
        ],
      ),
      body: _isLoading && _tasksResponse == null
          ? const Center(child: CircularProgressIndicator())
          : _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_tasksResponse == null || _tasksResponse!.tasks.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.download_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No download tasks', style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        if (_activeTasks.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Downloading (${_activeTasks.length})',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _buildTaskCard(context, _activeTasks[index]);
            }, childCount: _activeTasks.length),
          ),
        ],
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Queue (${_otherTasks.length})',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildTaskCard(context, _otherTasks[index]);
          }, childCount: _otherTasks.length),
        ),
      ],
    );
  }

  Widget _buildTaskCard(BuildContext context, DownloadTaskInfo task) {
    final progress = task.totalSize > 0
        ? (task.downloadedSize.toDouble() / task.totalSize.toDouble() * 100).toStringAsFixed(1)
        : '0.0';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.fileName,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildStatusChip(task.status),
              ],
            ),
            const SizedBox(height: 8),
            if (task.status == TaskStatus.DOWNLOADING || task.status == TaskStatus.WAITING)
              Column(
                children: [
                  LinearProgressIndicator(
                    value: task.totalSize > 0 ? task.downloadedSize.toDouble() / task.totalSize.toDouble() : 0,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${filesize(task.downloadedSize.toInt())} / ${filesize(task.totalSize.toInt())}',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Text('$progress%', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            if (task.status != TaskStatus.DOWNLOADING && task.status != TaskStatus.WAITING)
              Text(
                '${filesize(task.downloadedSize.toInt())} / ${filesize(task.totalSize.toInt())}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: _buildTaskActions(context, task)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    Color color;
    String text;

    switch (status) {
      case TaskStatus.WAITING:
        color = Colors.orange;
        text = 'Waiting';
        break;
      case TaskStatus.DOWNLOADING:
        color = Colors.blue;
        text = 'Downloading';
        break;
      case TaskStatus.PAUSED:
        color = Colors.grey;
        text = 'Paused';
        break;
      case TaskStatus.COMPLETED:
        color = Colors.green;
        text = 'Completed';
        break;
      case TaskStatus.FAILED:
        color = Colors.red;
        text = 'Failed';
        break;
      case TaskStatus.CANCELLED:
        color = Colors.grey;
        text = 'Cancelled';
        break;
      default:
        color = Colors.grey;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
      child: Text(text, style: TextStyle(fontSize: 10, color: color)),
    );
  }

  List<Widget> _buildTaskActions(BuildContext context, DownloadTaskInfo task) {
    final actions = <Widget>[];

    if (task.status == TaskStatus.DOWNLOADING) {
      actions.add(IconButton(icon: const Icon(Icons.pause, size: 18), onPressed: () => _pauseTask(task.id)));
    }

    if (task.status == TaskStatus.PAUSED) {
      actions.add(IconButton(icon: const Icon(Icons.play_arrow, size: 18), onPressed: () => _resumeTask(task.id)));
    }

    if (task.status == TaskStatus.FAILED) {
      actions.add(IconButton(icon: const Icon(Icons.refresh, size: 18), onPressed: () => _retryTask(task.id)));
    }

    if (task.status == TaskStatus.DOWNLOADING ||
        task.status == TaskStatus.PAUSED ||
        task.status == TaskStatus.WAITING) {
      actions.add(IconButton(icon: const Icon(Icons.cancel, size: 18), onPressed: () => _cancelTask(task.id)));
    }

    return actions;
  }

  Future<void> _pauseTask(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).pauseDownloadTask(taskId: taskId);
      _loadTasks();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to pause task: $e')));
      }
    }
  }

  Future<void> _resumeTask(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).resumeDownloadTask(taskId: taskId);
      _loadTasks();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to resume task: $e')));
      }
    }
  }

  Future<void> _retryTask(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).retryTask(taskId: taskId);
      _loadTasks();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to retry task: $e')));
      }
    }
  }

  Future<void> _cancelTask(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).cancelDownloadTask(taskId: taskId);
      _loadTasks();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to cancel task: $e')));
      }
    }
  }

  Future<void> _clearCompleted() async {
    try {
      await ref.read(downloadServiceProvider.notifier).clearCompleted();
      _loadTasks();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to clear completed: $e')));
      }
    }
  }
}
