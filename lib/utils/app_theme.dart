import 'package:flutter/material.dart';

/// Uygulamanın ortak Material 3 görünümü.
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51B5)),
    scaffoldBackgroundColor: const Color(0xFFF7F7FB),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    appBarTheme: const AppBarTheme(centerTitle: false, backgroundColor: Color(0xFFF7F7FB)),
  );
}
