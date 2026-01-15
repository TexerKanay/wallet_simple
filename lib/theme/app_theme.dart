import 'package:flutter/material.dart';

// Тема приложения в стиле криптобиржи
class AppTheme {
  // Темная тема (основная)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFFF3BA2F), // Золотой (как Binance)
        secondary: const Color(0xFF1E2329), // Темно-серый
        surface: const Color(0xFF181A20), // Почти черный
        error: const Color(0xFFEA3943), // Красный для падения
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF0B0E11),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF181A20),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF181A20),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF3BA2F),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // Цвета для роста/падения
  static const Color positiveColor = Color(0xFF0ECB81); // Зеленый
  static const Color negativeColor = Color(0xFFEA3943); // Красный
  
  // Дополнительные цвета
  static const Color cardColor = Color(0xFF181A20);
  static const Color dividerColor = Color(0xFF2B3139);
}
