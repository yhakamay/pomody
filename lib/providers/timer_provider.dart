import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider =
    ChangeNotifierProvider<TimerController>((_) => TimerController());

enum TimerMode {
  workTimer,
  breakTimer;

  TimerMode toggle() {
    if (this == TimerMode.workTimer) {
      return TimerMode.breakTimer;
    } else {
      return TimerMode.workTimer;
    }
  }
}

class TimerController extends ChangeNotifier {
  final controller = CountDownController();
  int workDuration = 25 * 60;
  int breakDuration = 5 * 60;
  TimerMode mode = TimerMode.workTimer;

  void setWorkDuration(int newDuration) {
    workDuration = newDuration;
    notifyListeners();
  }

  void setBreakDuration(int newDuration) {
    breakDuration = newDuration;
    notifyListeners();
  }

  void start() {
    controller.restart(
      duration: mode == TimerMode.workTimer ? workDuration : breakDuration,
    );

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
    toggleMode();

    controller.reset();

    controller.isStarted = false;
    controller.isPaused = false;
    controller.isResumed = false;

    notifyListeners();
  }

  void toggleMode() {
    mode = mode.toggle();
  }
}
