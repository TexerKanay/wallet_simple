import '../models/crypto_currency.dart';
import 'dart:math';

// Сервис для получения данных о криптовалютах
// В реальном приложении здесь будут HTTP запросы к API
class CryptoService {
  // Генерация случайных данных для демонстрации
  final Random _random = Random();

  // Получить список всех криптовалют
  Future<List<CryptoCurrency>> getCryptoList() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 500));

    final List<CryptoCurrency> cryptos = [
      _createCrypto(
        id: 'bitcoin',
        symbol: 'BTC',
        name: 'Bitcoin',
        basePrice: 45000,
      ),
      _createCrypto(
        id: 'ethereum',
        symbol: 'ETH',
        name: 'Ethereum',
        basePrice: 2800,
      ),
      _createCrypto(
        id: 'binancecoin',
        symbol: 'BNB',
        name: 'BNB',
        basePrice: 320,
      ),
      _createCrypto(
        id: 'solana',
        symbol: 'SOL',
        name: 'Solana',
        basePrice: 95,
      ),
      _createCrypto(
        id: 'cardano',
        symbol: 'ADA',
        name: 'Cardano',
        basePrice: 0.55,
      ),
      _createCrypto(
        id: 'polkadot',
        symbol: 'DOT',
        name: 'Polkadot',
        basePrice: 7.2,
      ),
      _createCrypto(
        id: 'dogecoin',
        symbol: 'DOGE',
        name: 'Dogecoin',
        basePrice: 0.08,
      ),
      _createCrypto(
        id: 'avalanche',
        symbol: 'AVAX',
        name: 'Avalanche',
        basePrice: 35,
      ),
    ];

    return cryptos;
  }

  // Получить детали конкретной криптовалюты
  Future<CryptoCurrency> getCryptoDetails(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    // В реальном приложении здесь будет запрос к API
    final cryptos = await getCryptoList();
    return cryptos.firstWhere((crypto) => crypto.id == id);
  }

  // Создание криптовалюты с случайными данными
  CryptoCurrency _createCrypto({
    required String id,
    required String symbol,
    required String name,
    required double basePrice,
  }) {
    final changePercent = (_random.nextDouble() * 10 - 5); // от -5% до +5%
    final currentPrice = basePrice * (1 + changePercent / 100);
    final change24h = currentPrice - basePrice;
    final marketCap = currentPrice * _random.nextDouble() * 1000000;
    final volume = marketCap * _random.nextDouble() * 0.3;
    final high = currentPrice * (1 + _random.nextDouble() * 0.05);
    final low = currentPrice * (1 - _random.nextDouble() * 0.05);

    // Генерация истории цен (последние 24 часа)
    final priceHistory = List.generate(24, (index) {
      final time = DateTime.now().subtract(Duration(hours: 23 - index));
      final priceVariation = _random.nextDouble() * 0.1 - 0.05; // ±5%
      final price = currentPrice * (1 + priceVariation);
      return PricePoint(time: time, price: price);
    });

    return CryptoCurrency(
      id: id,
      symbol: symbol,
      name: name,
      imageUrl: 'https://cryptoicons.org/api/icon/$symbol.toLowerCase()/200',
      currentPrice: currentPrice,
      priceChange24h: change24h,
      priceChangePercentage24h: changePercent,
      marketCap: marketCap,
      volume24h: volume,
      high24h: high,
      low24h: low,
      priceHistory: priceHistory,
    );
  }

  // Обновление данных (для реального времени)
  Future<List<CryptoCurrency>> refreshCryptoList() async {
    return getCryptoList();
  }
}
