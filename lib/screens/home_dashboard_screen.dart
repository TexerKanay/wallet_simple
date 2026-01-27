import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.account_circle, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Поиск монет...',
                    prefixIcon: Icon(Icons.search, size: 20),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    filled: true,
                    fillColor: Color(0xFF2B3139),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.qr_code_scanner, size: 24),
            SizedBox(width: 12),
            Icon(Icons.notifications_none, size: 24),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Action Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.download, 'Депозит'),
                  _buildActionButton(Icons.people, 'Рефералы'),
                  _buildActionButton(Icons.grid_view, 'Больше'),
                ],
              ),
            ),
            
            // Stats / Announcements Banner (Mock)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2B3139),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.volume_up, size: 16, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('Новый листинг: TOKEN/USDT', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Hot List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Горячие', 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildHotCoinRow('BNB', '602.5', '+2.4%'),
            _buildHotCoinRow('BTC', '96,321.0', '-0.5%'),
            _buildHotCoinRow('ETH', '2,845.1', '+1.1%'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF2B3139),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFFF3BA2F), size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildHotCoinRow(String symbol, String price, String change) {
    final bool isPositive = change.startsWith('+');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text('/USDT', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Text(price, style: const TextStyle(fontSize: 16)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPositive ? const Color(0xFF0ECB81) : const Color(0xFFEA3943),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              change,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
