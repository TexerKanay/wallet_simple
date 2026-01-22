// Модель портфеля пользователя
class Portfolio {
  final double totalBalance;
  final double totalProfit;
  final double totalProfitPercentage;
  final List<PortfolioItem> items;

  Portfolio({
    required this.totalBalance,
    required this.totalProfit,
    required this.totalProfitPercentage,
    required this.items,
  });

  // Форматирование общего баланса
  String get formattedBalance => '\$${totalBalance.toStringAsFixed(2)}';
  
  // Форматирование прибыли
  String get formattedProfit => 
      '${totalProfit >= 0 ? '+' : ''}\$${totalProfit.toStringAsFixed(2)}';
  
  // Форматирование процента прибыли
  String get formattedProfitPercentage => 
      '${totalProfitPercentage >= 0 ? '+' : ''}${totalProfitPercentage.toStringAsFixed(2)}%';
}

// Элемент портфеля
class PortfolioItem {
  final String cryptoId;
  final String symbol;
  final String name;
  final double amount;
  final double averagePrice;
  final double currentPrice;
  final double value;
  final double profit;
  final double profitPercentage;

  PortfolioItem({
    required this.cryptoId,
    required this.symbol,
    required this.name,
    required this.amount,
    required this.averagePrice,
    required this.currentPrice,
    required this.value,
    required this.profit,
    required this.profitPercentage,
  });

  bool get isPositive => profit >= 0;
}
