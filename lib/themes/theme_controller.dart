import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/forcast_provider.dart';

class ThemeController {}

ThemeMode getTheme(BuildContext context) {
  return context.watch<Forcast>().isDark ?? false
      ? ThemeMode.dark
      : ThemeMode.light;
}
