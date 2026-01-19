import 'package:flutter/foundation.dart';
import '../models/crypto_currency.dart';
import '../services/crypto_service.dart';

// Провайдер для управления состоянием криптовалют
class CryptoProvider with ChangeNotifier {
  final CryptoService _cryptoService = CryptoService();
  
  List<CryptoCurrency> _cryptos = [];
  bool _isLoading = false;
  String? _error;

  List<CryptoCurrency> get cryptos => _cryptos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Загрузка списка криптовалют
  Future<void> loadCryptoList() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _cryptos = await _cryptoService.getCryptoList();
      _error = null;
    } catch (e) {
      _error = 'Ошибка загрузки данных: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Обновление данных
  Future<void> refreshCryptoList() async {
    try {
      _cryptos = await _cryptoService.refreshCryptoList();
      notifyListeners();
    } catch (e) {
      _error = 'Ошибка обновления: ${e.toString()}';
      notifyListeners();
    }
  }

  // Получить криптовалюту по ID
  CryptoCurrency? getCryptoById(String id) {
    try {
      return _cryptos.firstWhere((crypto) => crypto.id == id);
    } catch (e) {
      return null;
    }
  }
}
