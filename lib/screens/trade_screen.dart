import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  bool isBuy = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Спот'),
        actions: [
          IconButton(icon: const Icon(Icons.bar_chart), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side: Order Form
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isBuy = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isBuy ? const Color(0xFF0ECB81) : const Color(0xFF2B3139),
                              borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
                            ),
                            alignment: Alignment.center,
                            child: const Text('Купить', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isBuy = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: !isBuy ? const Color(0xFFEA3943) : const Color(0xFF2B3139),
                              borderRadius: const BorderRadius.horizontal(right: Radius.circular(4)),
                            ),
                            alignment: Alignment.center,
                            child: const Text('Продать', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInput('Лимит'),
                  const SizedBox(height: 8),
                  _buildInput('Цена (USDT)'),
                  const SizedBox(height: 8),
                  _buildInput('Количество'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isBuy ? const Color(0xFF0ECB81) : const Color(0xFFEA3943),
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    child: Text(isBuy ? 'Купить BTC' : 'Продать BTC', style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Right Side: Order Book (Mock)
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Цена', style: TextStyle(color: Colors.grey, fontSize: 10)),
                  const SizedBox(height: 4),
                  _buildOrderBookRow('96,321.0', const Color(0xFFEA3943)),
                  _buildOrderBookRow('96,322.5', const Color(0xFFEA3943)),
                  _buildOrderBookRow('96,325.0', const Color(0xFFEA3943)),
                  _buildOrderBookRow('96,327.2', const Color(0xFFEA3943)),
                  const Divider(height: 16, color: Color(0xFF2B3139)),
                  Center(
                    child: Text(
                      '96,321.0', 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: isBuy ? const Color(0xFF0ECB81) : const Color(0xFFEA3943),
                      ),
                    ),
                  ),
                  const Divider(height: 16, color: Color(0xFF2B3139)),
                  _buildOrderBookRow('96,319.4', const Color(0xFF0ECB81)),
                  _buildOrderBookRow('96,318.0', const Color(0xFF0ECB81)),
                  _buildOrderBookRow('96,315.2', const Color(0xFF0ECB81)),
                  _buildOrderBookRow('96,314.5', const Color(0xFF0ECB81)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String hint) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF2B3139),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildOrderBookRow(String price, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(price, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
