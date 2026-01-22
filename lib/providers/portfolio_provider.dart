import 'package:flutter/foundation.dart';
import '../models/portfolio.dart';
import '../services/portfolio_service.dart';

// Провайдер для управления состоянием портфеля
class PortfolioProvider with ChangeNotifier {
  final PortfolioService _portfolioService = PortfolioService();
  
  Portfolio? _portfolio;
  bool _isLoading = false;
  String? _error;

  Portfolio? get portfolio => _portfolio;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Загрузка портфеля
  Future<void> loadPortfolio() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _portfolio = await _portfolioService.getPortfolio();
      _error = null;
    } catch (e) {
      _error = 'Ошибка загрузки портфеля: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Обновление портфеля
  Future<void> refreshPortfolio() async {
    try {
      _portfolio = await _portfolioService.getPortfolio();
      notifyListeners();
    } catch (e) {
      _error = 'Ошибка обновления портфеля: ${e.toString()}';
      notifyListeners();
    }
  }
}
