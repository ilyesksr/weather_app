import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/db/shPref.dart';
import 'package:weather_app/provider/forcast_provider.dart';
import 'package:weather_app/themes/dark_theme.dart';
import 'package:weather_app/themes/light_theme.dart';
import 'package:weather_app/themes/theme_controller.dart';
import 'package:weather_app/ui/pages/splash_screen.dart';
import 'package:weather_app/ui/widgets/noconnection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs().initSh();
  runApp(
    ChangeNotifierProvider(
        create: (context) => Forcast(), builder: (context, _) => const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();
    context.read<Forcast>().fetshThemeData();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnectedNotifier.value = false;
      } else {
        isConnectedNotifier.value = true;
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //   locale: DevicePreview.locale(context),
      //   builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: getTheme(context),
      home: const SplashScreen(),
    );
  }
}
