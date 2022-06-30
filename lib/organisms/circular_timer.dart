import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/timer_provider.dart';

class CircularTimer extends HookConsumerWidget {
  const CircularTimer({Key? key}) : super(key: key);

  final _size = 240.0;
  final _textStyle = const TextStyle(fontSize: 48.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

    return Center(
      child: CircularCountDownTimer(
        controller: timer.controller,
        autoStart: false,
        duration: timer.mode == TimerMode.workTimer
            ? timer.workDuration
            : timer.breakDuration,
        isReverse: true,
        isReverseAnimation: true,
        height: _size,
        width: _size,
        ringColor: timer.controller.isStarted
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Theme.of(context).primaryColor,
        fillColor: Theme.of(context).primaryColor,
        strokeWidth: 12,
        strokeCap: StrokeCap.round,
        textStyle: _textStyle,
        onStart: _onStart,
        onComplete: () => _onComplete(timer),
      ),
    );
  }

  void _onStart() {
    // Nothing is planned for now
  }

  Future<void> _onComplete(timer) async {
    _notify(timer.mode);
    timer.toggleMode();
    timer.start();
  }

  Future<void> _notify(TimerMode mode) async {
    final flnp = FlutterLocalNotificationsPlugin();
    const title = 'Pomodo';
    String body =
        mode == TimerMode.workTimer ? 'Time for a break!' : 'Time to work!';

    await flnp.initialize(
        const InitializationSettings(iOS: IOSInitializationSettings()));

    flnp.show(
        0,
        title,
        body,
        const NotificationDetails(
            iOS: IOSNotificationDetails(presentAlert: true)));
  }
}
