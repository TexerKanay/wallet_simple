import 'package:flutter/material.dart';

class FuturesScreen extends StatelessWidget {
  const FuturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фьючерсы'),
        actions: [
           IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.candlestick_chart, size: 64, color: Color(0xFFF3BA2F)),
            const SizedBox(height: 16),
            const Text(
              'Торговля фьючерсами\nскоро будет доступна',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Активировать аккаунт'),
            ),
          ],
        ),
      ),
    );
  }
}
