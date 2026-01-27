import 'package:flutter/material.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кошелек'),
        actions: [
          IconButton(
             icon: const Icon(Icons.history),
             onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Balance Card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Общий баланс', style: TextStyle(color: Colors.grey)),
                  IconButton(
                    icon: Icon(_isBalanceVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                    onPressed: () => setState(() => _isBalanceVisible = !_isBalanceVisible),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _isBalanceVisible ? '0.041284 BTC' : '******',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                _isBalanceVisible ? '≈ \$3,982.50' : '******',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
             
              const SizedBox(height: 24),
              
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   _buildAssetsButton('Депозит', const Color(0xFFF3BA2F), Colors.black),
                   _buildAssetsButton('Вывод', const Color(0xFF2B3139), Colors.white),
                   _buildAssetsButton('Перевод', const Color(0xFF2B3139), Colors.white),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Assets List
              const Text('Активы', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              _buildAssetRow('USDT', 'Tether', '1,250.00', '\$1,250.00'),
              _buildAssetRow('BTC', 'Bitcoin', '0.025', '\$2,408.00'),
              _buildAssetRow('ETH', 'Ethereum', '0.12', '\$341.40'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssetsButton(String label, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildAssetRow(String symbol, String name, String amount, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               CircleAvatar(
                 backgroundColor: const Color(0xFF2B3139),
                 child: Text(symbol[0], style: const TextStyle(color: Colors.white)),
               ),
               const SizedBox(width: 12),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold)),
                   Text(name, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                 ],
               ),
            ],
          ),
          Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
               Text(value, style: const TextStyle(color: Colors.grey, fontSize: 12)),
             ],
          ),
        ],
      ),
    );
  }
}
