import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../atoms/outlined_card.dart';
import '../providers/timer_provider.dart';

class WorkDurationCard extends HookConsumerWidget {
  const WorkDurationCard({
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
            'Work session',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 16),
          DropdownButton<int>(
            value: timer.workDuration ~/ 60,
            items: const [
              DropdownMenuItem(value: 15, child: Text('15 min')),
              DropdownMenuItem(value: 25, child: Text('25 min')),
              DropdownMenuItem(value: 45, child: Text('45 min')),
            ],
            onChanged: (int? value) => timer.setWorkDuration(value! * 60),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
