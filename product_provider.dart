import 'dart:async';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/stock_service.dart';

class ProductProvider extends ChangeNotifier {
  final StockService _stockService;
  List<Product> _products = [];
  StreamSubscription? _stockSubscription;

  // Initial Mock Data
  ProductProvider(this._stockService) {
    _initProducts();
    _listenToStockUpdates();
  }

  @override
  void dispose() {
    _stockSubscription?.cancel();
    super.dispose();
  }

  List<Product> get products => [..._products];

  void _initProducts() {
    _products = [
      const Product(
        id: '1',
        name: 'Gaming Mouse',
        description: 'High precision wireless gaming mouse with RGB lighting.',
        price: 49.99,
        imageUrl: 'https://picsum.photos/id/1/200/200',
        stock: 10,
      ),
      const Product(
        id: '2',
        name: 'Mechanical Keyboard',
        description: 'Clicky blue switches with customizable keycaps.',
        price: 89.99,
        imageUrl: 'https://picsum.photos/id/2/200/200',
        stock: 15,
      ),
      const Product(
        id: '3',
        name: 'Noise Cancelling Headphones',
        description: 'Over-ear headphones with active noise cancellation.',
        price: 199.99,
        imageUrl: 'https://picsum.photos/id/3/200/200',
        stock: 5,
      ),
      const Product(
        id: '4',
        name: 'Smartphone Stand',
        description: 'Adjustable aluminum stand for smartphones and tablets.',
        price: 14.99,
        imageUrl: 'https://picsum.photos/id/4/200/200',
        stock: 20,
      ),
      const Product(
        id: '5',
        name: 'USB-C Hub',
        description: '7-in-1 USB-C hub with HDMI, USB 3.0, and SD card reader.',
        price: 39.99,
        imageUrl: 'https://picsum.photos/id/5/200/200',
        stock: 8,
      ),
      const Product(
        id: '6',
        name: 'Smart Watch',
        description: 'Fitness tracker with heart rate monitor and GPS.',
        price: 129.99,
        imageUrl: 'https://picsum.photos/id/6/200/200',
        stock: 3,
      ),
    ];

    // Start simulating updates for these products
    _stockService.startSimulation(_products.map((p) => p.id).toList());
  }

  void _listenToStockUpdates() {
    _stockSubscription = _stockService.stockStream.listen((stockUpdate) {
      for (var entry in stockUpdate.entries) {
        final productId = entry.key;
        final delta = entry.value;

        final index = _products.indexWhere((p) => p.id == productId);
        if (index != -1) {
          final currentProduct = _products[index];
          final newStock = currentProduct.stock + delta;

          if (newStock >= 0) {
            _products[index] = currentProduct.copyWith(stock: newStock);
            notifyListeners();
          }
        }
      }
    });
  }

  Product findById(String id) {
    return _products.firstWhere((p) => p.id == id);
  }
}
