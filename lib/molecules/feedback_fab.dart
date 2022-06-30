import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackFAB extends StatelessWidget {
  const FeedbackFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        launchUrl(
          Uri.parse('https://github.com/yhakamay/pomody/issues'),
        );
      },
      label: const Text('Give Feedback'),
    );
  }
}
