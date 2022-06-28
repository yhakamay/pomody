import 'package:flutter/material.dart';

import '../providers/timer_provider.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    Key? key,
    required this.timer,
  }) : super(key: key);

  final TimerController timer;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (timer.controller.isPaused) {
          timer.resume();
        } else if (timer.controller.isStarted) {
          timer.pause();
        } else {
          timer.start();
        }
      },
      child: timer.controller.isPaused || !timer.controller.isStarted
          ? const Icon(Icons.play_arrow_rounded)
          : const Icon(Icons.pause_rounded),
    );
  }
}
