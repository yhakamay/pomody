import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../molecules/reset_button.dart';
import '../molecules/start_pause_button.dart';
import '../providers/timer_provider.dart';

class TimerFABs extends HookConsumerWidget {
  const TimerFABs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

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
