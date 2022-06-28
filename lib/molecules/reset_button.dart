import 'package:flutter/material.dart';

import '../providers/timer_provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
    required this.timer,
  }) : super(key: key);

  final TimerController timer;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: timer.controller.isPaused ? timer.reset : null,
      child: const Icon(Icons.restart_alt_rounded),
    );
  }
}
