import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    fontFamily: 'YourCustomFont',
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    fontFamily: 'YourCustomFont',
  );
}