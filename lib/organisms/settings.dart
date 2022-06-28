import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Text('Work duration'),
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
