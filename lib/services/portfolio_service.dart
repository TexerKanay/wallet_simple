import '../models/portfolio.dart';

// Сервис для работы с портфелем пользователя
class PortfolioService {

  // Получить портфель пользователя
  Future<Portfolio> getPortfolio() async {
    // Имитация задержки
    await Future.delayed(const Duration(milliseconds: 300));

    // Мок-данные портфеля
    final portfolioItems = [
      PortfolioItem(
        cryptoId: 'bitcoin',
        symbol: 'BTC',
        name: 'Bitcoin',
        amount: 0.5,
        averagePrice: 42000,
        currentPrice: 45000,
        value: 22500,
        profit: 1500,
        profitPercentage: 7.14,
      ),
      PortfolioItem(
        cryptoId: 'ethereum',
        symbol: 'ETH',
        name: 'Ethereum',
        amount: 10,
        averagePrice: 2600,
        currentPrice: 2800,
        value: 28000,
        profit: 2000,
        profitPercentage: 7.69,
      ),
      PortfolioItem(
        cryptoId: 'solana',
        symbol: 'SOL',
        name: 'Solana',
        amount: 100,
        averagePrice: 90,
        currentPrice: 95,
        value: 9500,
        profit: 500,
        profitPercentage: 5.56,
      ),
    ];

    final totalBalance = portfolioItems.fold<double>(
      0,
      (sum, item) => sum + item.value,
    );

    final totalProfit = portfolioItems.fold<double>(
      0,
      (sum, item) => sum + item.profit,
    );

    final totalInvested = portfolioItems.fold<double>(
      0,
      (sum, item) => sum + (item.averagePrice * item.amount),
    );

    final totalProfitPercentage = totalInvested > 0
        ? ((totalBalance - totalInvested) / totalInvested) * 100.0
        : 0.0;

    return Portfolio(
      totalBalance: totalBalance,
      totalProfit: totalProfit,
      totalProfitPercentage: totalProfitPercentage,
      items: portfolioItems,
    );
  }
}
