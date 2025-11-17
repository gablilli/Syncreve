import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filesize/filesize.dart';
import 'package:syncreve/providers/download_service_provider.dart';
import 'package:syncreve/providers/upload_service_provider.dart';
import 'package:syncreve/generated/grpc/download_service.pb.dart';
import 'package:syncreve/generated/grpc/upload_service.pb.dart';

/// Task Manager Screen - 任务管理页面（上传和下载）
class TaskManagerScreen extends ConsumerStatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  ConsumerState<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends ConsumerState<TaskManagerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ListTasksResponse? _downloadTasks;
  ListUploadTasksResponse? _uploadTasks;
  bool _isLoadingDownload = false;
  bool _isLoadingUpload = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadTasks();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    await Future.wait([_loadDownloadTasks(), _loadUploadTasks()]);
  }

  Future<void> _loadDownloadTasks() async {
    if (!mounted) return;
    setState(() => _isLoadingDownload = true);

    try {
      final response = await ref.read(downloadServiceProvider.notifier).getDownloadTasks();
      if (mounted) {
        setState(() {
          _downloadTasks = response;
          _isLoadingDownload = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingDownload = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load download tasks: $e')));
      }
    }
  }

  Future<void> _loadUploadTasks() async {
    if (!mounted) return;
    setState(() => _isLoadingUpload = true);

    try {
      final response = await ref.read(uploadServiceProvider.notifier).getUploadTasks();
      if (mounted) {
        setState(() {
          _uploadTasks = response;
          _isLoadingUpload = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingUpload = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load upload tasks: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final downloadCount = _downloadTasks?.tasks.length ?? 0;
    final uploadCount = _uploadTasks?.tasks.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Downloads ($downloadCount)'),
            Tab(text: 'Uploads ($uploadCount)'),
          ],
        ),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loadTasks)],
      ),
      body: TabBarView(controller: _tabController, children: [_buildDownloadTab(), _buildUploadTab()]),
    );
  }

  // ==================== 下载标签 ====================
  Widget _buildDownloadTab() {
    if (_isLoadingDownload && _downloadTasks == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_downloadTasks == null || _downloadTasks!.tasks.isEmpty) {
      return _buildEmptyView('No download tasks', Icons.download_outlined);
    }

    final activeTasks = _downloadTasks!.tasks
        .where((t) => t.status == TaskStatus.DOWNLOADING || t.status == TaskStatus.WAITING)
        .toList();
    final otherTasks = _downloadTasks!.tasks
        .where((t) => t.status != TaskStatus.DOWNLOADING && t.status != TaskStatus.WAITING)
        .toList();

    return Column(
      children: [
        if (activeTasks.isNotEmpty)
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text(
                  'Downloading (${activeTasks.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (otherTasks.where((t) => t.status == TaskStatus.COMPLETED).isNotEmpty)
                  TextButton.icon(
                    onPressed: _clearDownloadCompleted,
                    icon: const Icon(Icons.clear_all, size: 16),
                    label: const Text('Clear', style: TextStyle(fontSize: 12)),
                  ),
              ],
            ),
          ),
        Expanded(
          child: ListView(
            children: [
              ...activeTasks.map((task) => _buildDownloadTaskCard(task)),
              if (activeTasks.isNotEmpty && otherTasks.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Queue (${otherTasks.length})',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ...otherTasks.map((task) => _buildDownloadTaskCard(task)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadTaskCard(DownloadTaskInfo task) {
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
                _buildDownloadStatusChip(task.status),
              ],
            ),
            const SizedBox(height: 8),
            if (task.status == TaskStatus.DOWNLOADING || task.status == TaskStatus.WAITING) ...[
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
            ] else
              Text(
                '${filesize(task.downloadedSize.toInt())} / ${filesize(task.totalSize.toInt())}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            if (task.error.isNotEmpty) Text(task.error, style: const TextStyle(fontSize: 11, color: Colors.red)),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: _buildDownloadActions(task)),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadStatusChip(TaskStatus status) {
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

  List<Widget> _buildDownloadActions(DownloadTaskInfo task) {
    final actions = <Widget>[];

    if (task.status == TaskStatus.DOWNLOADING) {
      actions.add(IconButton(icon: const Icon(Icons.pause, size: 18), onPressed: () => _pauseDownload(task.id)));
    }
    if (task.status == TaskStatus.PAUSED) {
      actions.add(IconButton(icon: const Icon(Icons.play_arrow, size: 18), onPressed: () => _resumeDownload(task.id)));
    }
    if (task.status == TaskStatus.FAILED) {
      actions.add(IconButton(icon: const Icon(Icons.refresh, size: 18), onPressed: () => _retryDownload(task.id)));
    }
    if (task.status == TaskStatus.DOWNLOADING ||
        task.status == TaskStatus.PAUSED ||
        task.status == TaskStatus.WAITING) {
      actions.add(IconButton(icon: const Icon(Icons.cancel, size: 18), onPressed: () => _cancelDownload(task.id)));
    }

    return actions;
  }

  // ==================== 上传标签 ====================
  Widget _buildUploadTab() {
    if (_isLoadingUpload && _uploadTasks == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_uploadTasks == null || _uploadTasks!.tasks.isEmpty) {
      return _buildEmptyView('No upload tasks', Icons.upload_outlined);
    }

    final activeTasks = _uploadTasks!.tasks
        .where((t) => t.status == UploadTaskStatus.UPLOADING || t.status == UploadTaskStatus.UPLOAD_WAITING)
        .toList();
    final otherTasks = _uploadTasks!.tasks
        .where((t) => t.status != UploadTaskStatus.UPLOADING && t.status != UploadTaskStatus.UPLOAD_WAITING)
        .toList();

    return Column(
      children: [
        if (activeTasks.isNotEmpty)
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text(
                  'Uploading (${activeTasks.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (otherTasks.where((t) => t.status == UploadTaskStatus.UPLOAD_COMPLETED).isNotEmpty)
                  TextButton.icon(
                    onPressed: _clearUploadCompleted,
                    icon: const Icon(Icons.clear_all, size: 16),
                    label: const Text('Clear', style: TextStyle(fontSize: 12)),
                  ),
              ],
            ),
          ),
        Expanded(
          child: ListView(
            children: [
              ...activeTasks.map((task) => _buildUploadTaskCard(task)),
              if (activeTasks.isNotEmpty && otherTasks.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Queue (${otherTasks.length})',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ...otherTasks.map((task) => _buildUploadTaskCard(task)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUploadTaskCard(UploadTaskInfo task) {
    final progress = task.totalSize > 0
        ? (task.uploadedSize.toDouble() / task.totalSize.toDouble() * 100).toStringAsFixed(1)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.fileName,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'To: ${task.remotePath}',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                _buildUploadStatusChip(task.status),
              ],
            ),
            const SizedBox(height: 8),
            if (task.status == UploadTaskStatus.UPLOADING || task.status == UploadTaskStatus.UPLOAD_WAITING) ...[
              LinearProgressIndicator(
                value: task.totalSize > 0 ? task.uploadedSize.toDouble() / task.totalSize.toDouble() : 0,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${filesize(task.uploadedSize.toInt())} / ${filesize(task.totalSize.toInt())}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text('$progress%', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ] else
              Text(
                '${filesize(task.uploadedSize.toInt())} / ${filesize(task.totalSize.toInt())}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            if (task.error.isNotEmpty) Text(task.error, style: const TextStyle(fontSize: 11, color: Colors.red)),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: _buildUploadActions(task)),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadStatusChip(UploadTaskStatus status) {
    Color color;
    String text;

    switch (status) {
      case UploadTaskStatus.UPLOAD_WAITING:
        color = Colors.orange;
        text = 'Waiting';
        break;
      case UploadTaskStatus.UPLOADING:
        color = Colors.blue;
        text = 'Uploading';
        break;
      case UploadTaskStatus.UPLOAD_PAUSED:
        color = Colors.grey;
        text = 'Paused';
        break;
      case UploadTaskStatus.UPLOAD_COMPLETED:
        color = Colors.green;
        text = 'Completed';
        break;
      case UploadTaskStatus.UPLOAD_FAILED:
        color = Colors.red;
        text = 'Failed';
        break;
      case UploadTaskStatus.UPLOAD_CANCELLED:
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

  List<Widget> _buildUploadActions(UploadTaskInfo task) {
    final actions = <Widget>[];

    if (task.status == UploadTaskStatus.UPLOADING) {
      actions.add(IconButton(icon: const Icon(Icons.pause, size: 18), onPressed: () => _pauseUpload(task.id)));
    }
    if (task.status == UploadTaskStatus.UPLOAD_PAUSED) {
      actions.add(IconButton(icon: const Icon(Icons.play_arrow, size: 18), onPressed: () => _resumeUpload(task.id)));
    }
    if (task.status == UploadTaskStatus.UPLOAD_FAILED) {
      actions.add(IconButton(icon: const Icon(Icons.refresh, size: 18), onPressed: () => _retryUpload(task.id)));
    }
    if (task.status == UploadTaskStatus.UPLOADING ||
        task.status == UploadTaskStatus.UPLOAD_PAUSED ||
        task.status == UploadTaskStatus.UPLOAD_WAITING) {
      actions.add(IconButton(icon: const Icon(Icons.cancel, size: 18), onPressed: () => _cancelUpload(task.id)));
    }

    return actions;
  }

  Widget _buildEmptyView(String message, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  // ==================== 操作方法 ====================
  Future<void> _pauseDownload(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).pauseDownloadTask(taskId: taskId);
      _loadDownloadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _resumeDownload(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).resumeDownloadTask(taskId: taskId);
      _loadDownloadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _retryDownload(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).retryTask(taskId: taskId);
      _loadDownloadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _cancelDownload(String taskId) async {
    try {
      await ref.read(downloadServiceProvider.notifier).cancelDownloadTask(taskId: taskId);
      _loadDownloadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _clearDownloadCompleted() async {
    try {
      await ref.read(downloadServiceProvider.notifier).clearCompleted();
      _loadDownloadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _pauseUpload(String taskId) async {
    try {
      await ref.read(uploadServiceProvider.notifier).pauseUploadTask(taskId: taskId);
      _loadUploadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _resumeUpload(String taskId) async {
    try {
      await ref.read(uploadServiceProvider.notifier).resumeUploadTask(taskId: taskId);
      _loadUploadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _retryUpload(String taskId) async {
    try {
      await ref.read(uploadServiceProvider.notifier).retryTask(taskId: taskId);
      _loadUploadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _cancelUpload(String taskId) async {
    try {
      await ref.read(uploadServiceProvider.notifier).cancelUploadTask(taskId: taskId);
      _loadUploadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }

  Future<void> _clearUploadCompleted() async {
    try {
      await ref.read(uploadServiceProvider.notifier).clearCompleted();
      _loadUploadTasks();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    }
  }
}
