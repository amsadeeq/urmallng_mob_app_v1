import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: const Color(0xFFFFB800),
      scaffoldBackgroundColor: Colors.white,
      // adjust to use Material 3 if you want
      // useMaterial3: true,
      textTheme: const TextTheme(
        // headline4 is used in your onboarding code
        headlineLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 34, // adjust as needed
        ),
        titleMedium: TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }
}
