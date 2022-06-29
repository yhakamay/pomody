import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget? child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
