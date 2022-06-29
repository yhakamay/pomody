import 'package:flutter/material.dart';

import '../atoms/outlined_card.dart';

class BreakDurationCard extends StatelessWidget {
  const BreakDurationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      width: 300,
      height: 120,
      child: Column(
        // TODO: Implement after break timer is implemented
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Break',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.error,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              const SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    '${5 ~/ 60}',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
