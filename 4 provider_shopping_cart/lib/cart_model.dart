import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  Map<int, int> _cartItems = {};

  Map<int, int> get cartItems => _cartItems;

  void addToCart(index) {
    if (_cartItems.containsKey(index)) {
      _cartItems[index] += 1;
    } else {
      _cartItems[index] = 1;
    }
    notifyListeners();
  }

  void clear(index) {
    if (_cartItems.containsKey(index)) {
      _cartItems.remove(index);
      notifyListeners();
    }
  }
}
