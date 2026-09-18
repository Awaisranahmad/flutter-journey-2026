import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/models/products.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);
  int get itemCount => _items.length;
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.subtotal);
  String get formattedTotal => 'Rs.${totalPrice.toStringAsFixed(0)}';

  bool get isEmpty => _items.isEmpty;

  void addProduct(Products product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      _items.add(CartItem(product: product, quantity: 0));
    } else {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  void decreaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final newQty = _items[index].quantity - 1;
      if (newQty <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: newQty);
      }
      notifyListeners();
    }
  }

  void removeProduct(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }
}
