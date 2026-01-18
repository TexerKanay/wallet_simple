import 'package:flutter/material.dart';
import '../widgets/price_chart.dart';
import '../theme/app_theme.dart';
import '../services/crypto_service.dart';
import '../models/crypto_currency.dart';

// Экран деталей криптовалюты
class CryptoDetailScreen extends StatefulWidget {
  final String cryptoId;

  const CryptoDetailScreen({
    super.key,
    required this.cryptoId,
  });

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  final CryptoService _cryptoService = CryptoService();
  bool _isLoading = true;
  CryptoCurrency? _crypto;

  @override
  void initState() {
    super.initState();
    _loadCrypto();
  }

  Future<void> _loadCrypto() async {
    setState(() => _isLoading = true);
    try {
      final crypto = await _cryptoService.getCryptoDetails(widget.cryptoId);
      setState(() {
        _crypto = crypto;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
      }
    }
  }

  String _formatLargeNumber(double number) {
    if (number >= 1e12) {
      return '\$${(number / 1e12).toStringAsFixed(2)}T';
    } else if (number >= 1e9) {
      return '\$${(number / 1e9).toStringAsFixed(2)}B';
    } else if (number >= 1e6) {
      return '\$${(number / 1e6).toStringAsFixed(2)}M';
    } else if (number >= 1e3) {
      return '\$${(number / 1e3).toStringAsFixed(2)}K';
    }
    return '\$${number.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Детали'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final crypto = _crypto;
    if (crypto == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Детали'),
        ),
        body: const Center(
          child: Text('Криптовалюта не найдена'),
        ),
      );
    }

    final isPositive = crypto.isPositive;

    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // График цены
            PriceChart(crypto: crypto, height: 250),
            
            const SizedBox(height: 24),
            
            // Текущая цена
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Текущая цена',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        crypto.formattedPrice,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isPositive
                              ? AppTheme.positiveColor.withValues(alpha: 0.2)
                              : AppTheme.negativeColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                              size: 16,
                              color: isPositive
                                  ? AppTheme.positiveColor
                                  : AppTheme.negativeColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              crypto.formattedChange,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isPositive
                                    ? AppTheme.positiveColor
                                    : AppTheme.negativeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Статистика
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Статистика за 24ч',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatCard(
                    'Рыночная капитализация',
                    _formatLargeNumber(crypto.marketCap),
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    'Объем торгов',
                    _formatLargeNumber(crypto.volume24h),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          'Максимум',
                          '\$${crypto.high24h.toStringAsFixed(2)}',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          'Минимум',
                          '\$${crypto.low24h.toStringAsFixed(2)}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Кнопки действий
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Действие покупки
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Функция покупки в разработке')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.positiveColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Купить',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Действие продажи
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Функция продажи в разработке')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.negativeColor),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Продать',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.negativeColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
