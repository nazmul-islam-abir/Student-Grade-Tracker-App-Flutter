import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF1976D2),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1976D2),
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF1976D2),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF1976D2),
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Color(0xFF1A1A1A),
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF1A1A1A),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: Color(0xFF333333)),
      bodyMedium: TextStyle(color: Color(0xFF555555)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0D47A1),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D47A1),
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    cardTheme: CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFF64B5F6),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF0D47A1),
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2C2C2C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF64B5F6), width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
    ),
  );
}
