import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/timer_provider.dart';

class Settings extends HookConsumerWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

    return Column(
      children: [
        Center(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
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
                            '${timer.duration ~/ 60}',
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
            ),
          ),
        ),
        Center(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Text('Break duration'),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Text('Start break after work'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
