import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider =
    ChangeNotifierProvider<TimerController>((_) => TimerController());

class TimerController extends ChangeNotifier {
  final controller = CountDownController();
  final duration = 25 * 60;

  void start() {
    controller.start();

    controller.isStarted = true;
    controller.isPaused = false;
    controller.isResumed = false;

    notifyListeners();
  }

  void pause() {
    controller.pause();

    controller.isPaused = true;
    controller.isResumed = false;

    notifyListeners();
  }

  void resume() {
    controller.resume();

    controller.isPaused = false;
    controller.isResumed = true;

    notifyListeners();
  }

  void reset() {
    controller.reset();

    controller.isStarted = false;
    controller.isPaused = false;
    controller.isResumed = false;

    notifyListeners();
  }
}
