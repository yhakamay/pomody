import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Stack(
        children: [
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
          Positioned(
            bottom: 52,
            right: 68,
            child: OutlinedButton(
              onPressed: _countdownController.isPaused ? _reset : null,
              child: const Icon(Icons.restart_alt_rounded),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: _toolTip,
        child: _icon,
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
    // Switch to dark theme
  }

  void _onComplete() {}
}
