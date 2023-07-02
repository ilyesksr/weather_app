import 'package:flutter/material.dart';
import 'package:weather_app/themes/dark_theme.dart';
import 'package:weather_app/themes/light_theme.dart';
import 'package:weather_app/themes/theme_controller.dart';
import 'package:weather_app/ui/pages/home_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: getTheme(),
      home: const HomePage(),
    );
  }
}
