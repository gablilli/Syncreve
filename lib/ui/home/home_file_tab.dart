import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:filesize/filesize.dart';
import 'package:syncreve/providers/file_service_provider.dart';
import 'package:syncreve/providers/account_provider.dart';
import 'package:syncreve/generated/grpc/file_service.pb.dart';
import 'package:syncreve/ui/task_manager/task_manager_screen.dart';

/// Home File Tab - 文件管理标签页
class HomeFileTab extends ConsumerStatefulWidget {
  const HomeFileTab({super.key});

  @override
  ConsumerState<HomeFileTab> createState() => _HomeFileTabState();
}

class _HomeFileTabState extends ConsumerState<HomeFileTab> {
  List<String> _path = [];
  ListFilesResponse? _filesResponse;
  bool _isLoading = false;
  bool _isCardView = false;
  final Set<String> _selectedFiles = {};
  final ScrollController _pathScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  @override
  void dispose() {
    _pathScrollController.dispose();
    super.dispose();
  }

  String get _currentPath => '/${_path.join('/')}';

  Future<void> _loadFiles({bool refresh = false}) async {
    if (!mounted) return;

    setState(() => _isLoading = true);

    try {
      final response = await ref.read(fileServiceProvider.notifier).listFiles(path: _currentPath, refresh: refresh);

      if (mounted) {
        setState(() {
          _filesResponse = response;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load files: $e')));
      }
    }
  }

  void _navigateToPath(List<String> newPath) {
    setState(() {
      _path = newPath;
      _selectedFiles.clear();
    });
    _loadFiles();

    // 滚动到最右边
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pathScrollController.hasClients) {
        _pathScrollController.animateTo(
          _pathScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onFileTap(FileInfo file) {
    if (_selectedFiles.isNotEmpty) {
      _toggleFileSelection(file);
      return;
    }

    if (file.type == 'dir') {
      _navigateToPath([..._path, file.name]);
    } else {
      // TODO: 打开文件
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opening: ${file.name}')));
    }
  }

  void _toggleFileSelection(FileInfo file) {
    setState(() {
      if (_selectedFiles.contains(file.id)) {
        _selectedFiles.remove(file.id);
      } else {
        _selectedFiles.add(file.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentAccount = ref.watch(currentAccountProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: currentAccount == null ? _buildNoAccountView() : _buildFileList(context),
      bottomNavigationBar: _selectedFiles.isNotEmpty ? _buildBottomMenu(context) : null,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(child: Icon(Icons.person, size: 20)),
      ),
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(Icons.search, size: 16, color: Theme.of(context).hintColor),
            const SizedBox(width: 8),
            Text('Search file ...', style: TextStyle(fontSize: 13, color: Theme.of(context).hintColor)),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(_isCardView ? Icons.list : Icons.apps),
          onPressed: () => setState(() => _isCardView = !_isCardView),
        ),
        IconButton(
          icon: const Icon(Icons.task_alt),
          tooltip: 'Tasks',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TaskManagerScreen()));
          },
        ),
      ],
      bottom: PreferredSize(preferredSize: const Size.fromHeight(40), child: _buildPathBar(context)),
    );
  }

  Widget _buildPathBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: SingleChildScrollView(
        controller: _pathScrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPathItem('/', () => _navigateToPath([])),
            for (var i = 0; i < _path.length; i++)
              _buildPathItem(_path[i], () => _navigateToPath(_path.sublist(0, i + 1))),
          ],
        ),
      ),
    );
  }

  Widget _buildPathItem(String name, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 4),
          Text(name, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 2),
          const Icon(Icons.chevron_right, size: 18),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _buildNoAccountView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No account selected', style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildFileList(BuildContext context) {
    if (_isLoading && _filesResponse == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_filesResponse == null || _filesResponse!.files.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder_open, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No files', style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _loadFiles(refresh: true),
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadFiles(refresh: true),
      child: _isCardView ? _buildGridView(context) : _buildListView(context),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: _selectedFiles.isNotEmpty ? 70 : 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: _filesResponse!.files.length,
      itemBuilder: (context, index) {
        final file = _filesResponse!.files[index];
        return _buildGridItem(context, file);
      },
    );
  }

  Widget _buildGridItem(BuildContext context, FileInfo file) {
    final isSelected = _selectedFiles.contains(file.id);
    final isPic = false; // TODO: 实现缩略图检测

    return InkWell(
      onTap: () => _onFileTap(file),
      onLongPress: () => _toggleFileSelection(file),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Expanded(child: _buildFileIcon(file, isPic, isGrid: true)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    file.name,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          if (_selectedFiles.isNotEmpty)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank, size: 18),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: _selectedFiles.isNotEmpty ? 70 : 6),
      itemCount: _filesResponse!.files.length,
      itemBuilder: (context, index) {
        final file = _filesResponse!.files[index];
        return _buildListItem(context, file);
      },
    );
  }

  Widget _buildListItem(BuildContext context, FileInfo file) {
    final isSelected = _selectedFiles.contains(file.id);
    final isPic = false; // TODO: 实现缩略图检测

    return Card(
      child: ListTile(
        leading: SizedBox(width: 48, height: 48, child: _buildFileIcon(file, isPic)),
        title: Text(file.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${_formatDate(file.updatedAt)} ${file.size > 0 ? filesize(file.size.toInt()) : ''}',
          style: const TextStyle(fontSize: 11),
        ),
        trailing: _selectedFiles.isNotEmpty
            ? Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank, size: 18)
            : null,
        onTap: () => _onFileTap(file),
        onLongPress: () => _toggleFileSelection(file),
      ),
    );
  }

  Widget _buildFileIcon(FileInfo file, bool isPic, {bool isGrid = false}) {
    if (isPic) {
      // TODO: 显示缩略图
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(isGrid ? 12 : 8),
        ),
        child: const Center(child: Icon(Icons.image, color: Colors.grey)),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(isGrid ? 12 : 8),
      ),
      child: Center(
        child: Icon(
          file.type == 'dir' ? Icons.folder : FontAwesomeIcons.solidFile,
          color: Theme.of(context).iconTheme.color,
          size: isGrid ? 42 : 24,
        ),
      ),
    );
  }

  Widget _buildBottomMenu(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, -2))],
      ),
      child: Row(
        children: [
          _buildMenuButton(Icons.close, 'Close', () {
            setState(() => _selectedFiles.clear());
          }),
          _buildMenuButton(Icons.select_all, 'All', () {
            setState(() {
              if (_selectedFiles.length == _filesResponse!.files.length) {
                _selectedFiles.clear();
              } else {
                _selectedFiles.addAll(_filesResponse!.files.map((f) => f.id));
              }
            });
          }),
          Container(width: 1, height: 24, color: Colors.grey.withOpacity(0.3)),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMenuButton(Icons.download, 'Download', () {
                    // TODO: 实现下载
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Download - To be implemented')));
                  }),
                  _buildMenuButton(Icons.share, 'Share', () {
                    // TODO: 实现分享
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Share - To be implemented')));
                  }),
                  _buildMenuButton(Icons.delete, 'Delete', () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete'),
                        content: Text('Delete ${_selectedFiles.length} file(s)?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            style: TextButton.styleFrom(foregroundColor: Colors.red),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );

                    if (confirmed == true) {
                      // TODO: 实现删除
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Delete - To be implemented')));
                    }
                  }),
                  _buildMenuButton(Icons.more_horiz, 'More', () {
                    // TODO: 显示更多选项
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('More - To be implemented')));
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 9), maxLines: 1),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateStr;
    }
  }
}
