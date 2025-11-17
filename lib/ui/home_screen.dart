import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncreve/ui/home/home_file_tab.dart';
import 'package:syncreve/ui/home/home_sync_tab.dart';
import 'package:syncreve/ui/home/home_account_tab.dart';

/// Home Screen - 主页面，包含底部导航栏
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomeFileTab(), HomeSyncTab(), HomeAccountTab()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cloud), label: 'File'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.arrowsRotate), label: 'Sync'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.userLarge), label: 'Account'),
        ],
        onTap: _onTabTapped,
      ),
    );
  }
}
