import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../atoms/outlined_card.dart';
import '../providers/timer_provider.dart';

class BreakDurationCard extends HookConsumerWidget {
  const BreakDurationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

    return OutlinedCard(
      width: 300,
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 8),
          Text(
            'Break session',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 16),
          DropdownButton<int>(
            value: timer.breakDuration ~/ 60,
            items: const [
              DropdownMenuItem(value: 5, child: Text('5 min')),
              DropdownMenuItem(value: 10, child: Text('10 min')),
              DropdownMenuItem(value: 15, child: Text('15 min')),
            ],
            onChanged: (int? value) => timer.setBreakDuration(value! * 60),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
