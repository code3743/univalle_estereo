import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _fontHeadLine = Color(0XFF252525);
  static const Color _fontBodyText = Color(0xFF5B5B5B);
  // static const Color primaryColor = Color(0xFFC70007)
  static const Color primaryColor = Colors.red;

  static const String _fontFamily = 'Poppins';

  static ThemeData themeLight = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: _fontHeadLine),
      displayMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _fontHeadLine),
      displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: _fontHeadLine),
      headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: _fontHeadLine),
      headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: _fontHeadLine),
      headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: _fontHeadLine),
      titleLarge: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: _fontHeadLine),
      titleMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: _fontHeadLine),
      titleSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: _fontHeadLine),
      bodyLarge: TextStyle(
          fontFamily: _fontFamily, fontSize: 14, color: _fontBodyText),
    ),
  );
}
