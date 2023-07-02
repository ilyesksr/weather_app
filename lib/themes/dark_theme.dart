import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue, brightness: Brightness.dark),
      useMaterial3: true,
      brightness: Brightness.dark);
}
