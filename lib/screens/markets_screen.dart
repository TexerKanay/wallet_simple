import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/crypto_provider.dart';
import '../widgets/crypto_card.dart';
import 'crypto_detail_screen.dart';


// Экран со списком криптовалют (Рынки)
class MarketsScreen extends StatefulWidget {
  const MarketsScreen({super.key});

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
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
        title: const Text('Рынки'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
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
