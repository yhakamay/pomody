import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/home_page.dart';
import 'providers/timer_provider.dart';

final flnp = FlutterLocalNotificationsPlugin();
const iOSInitSettings = IOSInitializationSettings(
  requestSoundPermission: true,
  requestBadgePermission: false,
  requestAlertPermission: true,
);
const initSettings = InitializationSettings(iOS: iOSInitSettings);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await flnp.initialize(initSettings);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed:
            timer.mode == TimerMode.workTimer ? Colors.blue : Colors.pink,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
