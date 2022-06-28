import 'package:flutter/material.dart';

import '../molecules/reset_button.dart';
import '../molecules/start_pause_button.dart';
import '../providers/timer_provider.dart';

class TimerFABs extends StatelessWidget {
  const TimerFABs({
    Key? key,
    required this.timer,
  }) : super(key: key);

  final TimerController timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 96),
        StartPauseButton(timer: timer),
        SizedBox(
          width: 96,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: ResetButton(timer: timer),
          ),
        ),
      ],
    );
  }
}
