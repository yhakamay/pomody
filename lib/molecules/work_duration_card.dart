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
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Work',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: OutlinedButton(
                  onPressed: timer.reduceWork,
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.error,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    '${timer.workDuration ~/ 60}',
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: OutlinedButton(
                  onPressed: timer.addWork,
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
