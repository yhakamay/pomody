import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../molecules/feedback_fab.dart';
import '../organisms/circular_timer.dart';
import '../organisms/settings.dart';
import '../organisms/timer_fabs.dart';
import '../providers/timer_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(timerProvider);

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
      body: [
        const CircularTimer(),
        const Settings(),
      ][_pageIndex],
      floatingActionButton:
          _pageIndex == 0 ? TimerFABs(timer: timer) : const FeedbackFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
