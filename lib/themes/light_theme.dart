import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lightBlue, brightness: Brightness.light),
    useMaterial3: true,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xff006493).withAlpha(180)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIconColor: const Color(0xff006493).withAlpha(210)),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),

    ///
  );
}
