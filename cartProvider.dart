import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get totalCost {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

 void addToCart(Product product) {
  final existingItemIndex = _cartItems.indexWhere((item) => item.id == product.id);

  if (existingItemIndex != -1) {
    _cartItems[existingItemIndex].quantity += 1;
  } else {
    _cartItems.add(Product(
      id: product.id,
      name: product.name,
      price: product.price,
      quantity: 1,
    ));
  }

  notifyListeners();
}


 void removeFromCart(Product product) {
  final existingItemIndex = _cartItems.indexWhere((item) => item.id == product.id);

  if (existingItemIndex != -1) {
    final existingItem = _cartItems[existingItemIndex];
    if (existingItem.quantity > 1) {
      existingItem.quantity -= 1;
    } else {
      _cartItems.removeAt(existingItemIndex);
    }
  }

  notifyListeners();
}
}
