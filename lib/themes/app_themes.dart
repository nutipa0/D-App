import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.lightGreenAccent,
      secondary: Color(0xFFFFA07A),
      surface: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF4CAF50),
      secondary: Color(0xFFFF7043),
      surface: Color(0xFF121212),
      onPrimary: Colors.white,
    ),
  );
}
