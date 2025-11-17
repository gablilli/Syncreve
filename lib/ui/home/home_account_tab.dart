import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncreve/providers/account_provider.dart';
import 'package:syncreve/models/account.dart';
import 'package:syncreve/ui/setup_screen.dart';

/// Home Account Tab - 账户管理标签页
class HomeAccountTab extends ConsumerWidget {
  const HomeAccountTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountManagerProvider);
    final currentAccount = accountState.currentAccount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () => _showAddAccountDialog(context, ref))],
      ),
      body: accountState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : accountState.accounts.isEmpty
          ? _buildEmptyState(context)
          : _buildAccountList(context, ref, accountState, currentAccount),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text('No accounts', style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SetupScreen()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Account'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountList(BuildContext context, WidgetRef ref, AccountState accountState, Account? currentAccount) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: accountState.accounts.length,
      itemBuilder: (context, index) {
        final account = accountState.accounts[index];
        final isActive = account.id == currentAccount?.id;

        return Card(
          color: isActive ? Colors.blue.withOpacity(0.1) : null,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isActive ? Colors.blue : Colors.grey,
              child: Text(
                account.name.isNotEmpty ? account.name[0].toUpperCase() : '?',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(account.name, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(account.serverUrl, style: const TextStyle(fontSize: 12)),
                if (account.email != null)
                  Text(account.email!, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                    child: const Text('Active', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    _handleAccountAction(context, ref, account, value);
                  },
                  itemBuilder: (context) => [
                    if (!isActive) const PopupMenuItem(value: 'switch', child: Text('Switch to this account')),
                    const PopupMenuItem(value: 'logout', child: Text('Logout')),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
            onTap: isActive ? null : () => _switchAccount(context, ref, account.id),
          ),
        );
      },
    );
  }

  void _handleAccountAction(BuildContext context, WidgetRef ref, Account account, String action) {
    switch (action) {
      case 'switch':
        _switchAccount(context, ref, account.id);
        break;
      case 'logout':
        _logoutAccount(context, ref, account.id);
        break;
      case 'delete':
        _deleteAccount(context, ref, account.id);
        break;
    }
  }

  Future<void> _switchAccount(BuildContext context, WidgetRef ref, String accountId) async {
    try {
      await ref.read(accountManagerProvider.notifier).setCurrentAccount(accountId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account switched successfully')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to switch account: $e')));
      }
    }
  }

  Future<void> _logoutAccount(BuildContext context, WidgetRef ref, String accountId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Logout')),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await ref.read(accountManagerProvider.notifier).logout(accountId: accountId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out successfully')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to logout: $e')));
      }
    }
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref, String accountId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('Are you sure you want to delete this account? This action cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await ref.read(accountManagerProvider.notifier).deleteAccount(accountId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account deleted successfully')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete account: $e')));
      }
    }
  }

  void _showAddAccountDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Account Name', hintText: 'My Account'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(labelText: 'Server URL', hintText: 'https://example.com'),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final url = urlController.text.trim();

              if (name.isEmpty || url.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
                return;
              }

              Navigator.of(context).pop();

              try {
                await ref.read(accountManagerProvider.notifier).createAccount(name: name, serverUrl: url);
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Account created successfully')));
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create account: $e')));
                }
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
