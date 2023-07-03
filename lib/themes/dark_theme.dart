import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lightBlue, brightness: Brightness.dark),
    useMaterial3: true,
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
  );
}
