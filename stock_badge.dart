import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final int stock;

  const StockBadge({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    Color badgeColor = stock < 5 ? Colors.red : Colors.green;
    if (stock == 0) badgeColor = Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        stock == 0 ? 'Out of Stock' : 'Live Stock: $stock',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
