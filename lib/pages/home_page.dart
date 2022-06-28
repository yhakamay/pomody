import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../organisms/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _countdownController = CountDownController();
  final _duration = 25 * 60;
  final _size = 240.0;
  final _textStyle = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
  int _pageIndex = 0;
  String _toolTip = 'Start';
  Icon _icon = const Icon(Icons.play_arrow_rounded);

  @override
  void initState() {
    super.initState();
    _countdownController.isPaused = false;
    _countdownController.isResumed = false;
    _countdownController.isStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pomodo'),
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
        Center(
          child: CircularCountDownTimer(
            controller: _countdownController,
            autoStart: false,
            duration: _duration,
            isReverse: true,
            isReverseAnimation: true,
            height: _size,
            width: _size,
            ringColor: _countdownController.isStarted
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Theme.of(context).primaryColor,
            fillColor: Theme.of(context).primaryColor,
            strokeWidth: 12,
            strokeCap: StrokeCap.round,
            textStyle: _textStyle,
            onStart: _onStart,
            onComplete: _onComplete,
          ),
        ),
        const Settings(),
      ][_pageIndex],
      floatingActionButton: _pageIndex == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 96),
                FloatingActionButton(
                  onPressed: _onPressed,
                  tooltip: _toolTip,
                  child: _icon,
                ),
                SizedBox(
                  width: 96,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: OutlinedButton(
                      onPressed: _countdownController.isPaused ? _reset : null,
                      child: const Icon(Icons.restart_alt_rounded),
                    ),
                  ),
                ),
              ],
            )
          : FloatingActionButton.extended(
              onPressed: () {
                launchUrl(
                  Uri.parse('https://github.com/yhakamay/pomodo/issues'),
                );
              },
              label: const Text('Give Feedback'),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onPressed() {
    if (_countdownController.isPaused) {
      _resume();
    } else if (_countdownController.isStarted) {
      _pause();
    } else {
      _start();
    }
  }

  void _start() {
    _countdownController.start();

    setState(() {
      _countdownController.isStarted = true;
      _countdownController.isPaused = false;
      _countdownController.isResumed = false;
    });

    setState(() {
      _toolTip = 'Pause';
    });

    setState(() {
      _icon = const Icon(Icons.pause_rounded);
    });
  }

  void _pause() {
    _countdownController.pause();

    setState(() {
      _countdownController.isPaused = true;
      _countdownController.isResumed = false;
    });

    setState(() {
      _toolTip = 'Resume';
    });

    setState(() {
      _icon = const Icon(Icons.play_arrow_rounded);
    });
  }

  void _resume() {
    _countdownController.resume();

    setState(() {
      _countdownController.isPaused = false;
      _countdownController.isResumed = true;
    });

    setState(() {
      _toolTip = 'Pause';
    });

    setState(() {
      _icon = const Icon(Icons.pause_rounded);
    });
  }

  void _reset() {
    _countdownController.reset();

    setState(() {
      _countdownController.isStarted = false;
      _countdownController.isPaused = false;
      _countdownController.isResumed = false;
    });
  }

  void _onStart() {
    // Nothing is planned for now
  }

  void _onComplete() {
    // TODO: Show a snackbar & ring a sound
  }
}
