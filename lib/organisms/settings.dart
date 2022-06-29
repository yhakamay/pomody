import 'package:flutter/material.dart';

import '../molecules/break_duration_card.dart';
import '../molecules/work_duration_card.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(child: WorkDurationCard()),
        Center(child: BreakDurationCard()),
        //Center(child: StartBreakAfterWorkCard()),
      ],
    );
  }
}
