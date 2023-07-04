import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lightBlue, brightness: Brightness.dark),
    useMaterial3: true,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color(4287483391).withAlpha(180)),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      suffixIconColor: Color(4287483391).withAlpha(210),
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: Colors.white)),
  );
}
