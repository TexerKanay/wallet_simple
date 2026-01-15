import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/crypto_provider.dart';
import 'providers/portfolio_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

// Точка входа в приложение
void main() {
  runApp(const CryptoApp());
}

// Главный виджет приложения
class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Регистрация всех провайдеров для управления состоянием
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoProvider()),
        ChangeNotifierProvider(create: (_) => PortfolioProvider()),
      ],
      child: MaterialApp(
        title: 'Криптобиржа',
        debugShowCheckedModeBanner: false,
        // Применение темной темы в стиле криптобиржи
        theme: AppTheme.darkTheme,
        // Главный экран приложения
        home: const HomeScreen(),
      ),
    );
  }
}
