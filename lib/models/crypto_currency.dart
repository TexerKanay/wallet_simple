// Модель криптовалюты
class CryptoCurrency {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCap;
  final double volume24h;
  final double high24h;
  final double low24h;
  final List<PricePoint> priceHistory;

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.volume24h,
    required this.high24h,
    required this.low24h,
    required this.priceHistory,
  });

  // Проверка, растет ли цена (зеленый цвет)
  bool get isPositive => priceChange24h >= 0;

  // Форматирование цены
  String get formattedPrice => '\$${currentPrice.toStringAsFixed(2)}';
  
  // Форматирование изменения цены
  String get formattedChange => 
      '${isPositive ? '+' : ''}${priceChangePercentage24h.toStringAsFixed(2)}%';
}

// Точка на графике цены
class PricePoint {
  final DateTime time;
  final double price;

  PricePoint({
    required this.time,
    required this.price,
  });
}
