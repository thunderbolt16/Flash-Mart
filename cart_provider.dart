import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => [..._cartItems];

  int get itemCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    // Remove specific instance or just first match?
    // User probably expects removing the item row.
    // Since we don't track quantity per line item yet (just list of products),
    // removing by instance or ID is fine.
    // A simple List.remove(product) works if it's the same instance reference.
    // If not, we might need to remove by ID.
    // Given the ProductDetailScreen passes the product object, we can try removing relevant one.
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  bool isInCart(String productId) {
    return _cartItems.any((item) => item.id == productId);
  }
}
