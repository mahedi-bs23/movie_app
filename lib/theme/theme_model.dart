import 'package:flutter/material.dart';

class ThemeModel {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  ThemeModel({
    required this.lightTheme,
    required this.darkTheme,
  });


  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black12,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.black54,
      primaryContainer: Colors.white,
      secondaryContainer: Colors.black54,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ).copyWith(surface: Colors.white),
  );




  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor:  Colors.black,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),

      labelLarge: TextStyle(color: Colors.white54),
      labelMedium: TextStyle(color: Colors.white38),
      labelSmall: TextStyle(color: Colors.white30),

      headlineLarge: TextStyle(color: Colors.white24),
      headlineMedium: TextStyle(color: Colors.white12),
      headlineSmall: TextStyle(color: Colors.white10)

    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.white60,
      primaryContainer: Colors.white10,
      secondaryContainer: Colors.white60,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.red,
    ).copyWith(surface: Colors.white),
  );



}
