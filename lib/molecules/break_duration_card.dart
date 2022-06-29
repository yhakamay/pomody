import 'package:flutter/material.dart';

import '../atoms/outlined_card.dart';

class BreakDurationCard extends StatelessWidget {
  const BreakDurationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OutlinedCard(
      width: 300,
      height: 120,
      child: Center(
        // TODO: Implement
        child: Text('Break duration'),
      ),
    );
  }
}
