import 'package:flutter/material.dart';

import '../molecules/feedback_fab.dart';
import '../organisms/circular_timer.dart';
import '../organisms/settings.dart';
import '../organisms/timer_fabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pomody'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => setState(() {
          _pageIndex = index;
        }),
        selectedIndex: _pageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.timer_rounded),
            icon: Icon(Icons.timer_outlined),
            label: 'Timer',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_rounded),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          )
        ],
      ),
      body: IndexedStack(
        index: _pageIndex,
        children: const [
          CircularTimer(),
          Settings(),
        ],
      ),
      floatingActionButton:
          _pageIndex == 0 ? const TimerFABs() : const FeedbackFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
