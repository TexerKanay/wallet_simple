import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/crypto_provider.dart';
import '../widgets/crypto_card.dart';
import 'crypto_detail_screen.dart';
import 'portfolio_screen.dart';

// Главный экран со списком криптовалют
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Загружаем данные при открытии экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CryptoProvider>().loadCryptoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Криптовалюты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PortfolioScreen(),
                ),
              );
            },
            tooltip: 'Портфель',
          ),
        ],
      ),
      body: Consumer<CryptoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.cryptos.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null && provider.cryptos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.loadCryptoList(),
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            );
          }

          if (provider.cryptos.isEmpty) {
            return const Center(
              child: Text('Нет данных'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.refreshCryptoList(),
            child: ListView.builder(
              itemCount: provider.cryptos.length,
              itemBuilder: (context, index) {
                final crypto = provider.cryptos[index];
                return CryptoCard(
                  crypto: crypto,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CryptoDetailScreen(
                          cryptoId: crypto.id,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
