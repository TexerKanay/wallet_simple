import 'package:flutter/material.dart';
import 'home_dashboard_screen.dart';
import 'markets_screen.dart';
import 'trade_screen.dart';
import 'futures_screen.dart';
import 'assets_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeDashboardScreen(),
    MarketsScreen(),
    TradeScreen(),
    FuturesScreen(),
    AssetsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF181A20),
        selectedItemColor: const Color(0xFFF3BA2F),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Рынки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Сделка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.candlestick_chart),
            label: 'Фьючерсы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Кошелек',
          ),
        ],
      ),
    );
  }
}
