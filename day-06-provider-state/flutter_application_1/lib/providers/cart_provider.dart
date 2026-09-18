import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/products.dart';
// import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  // ---------- PRIVATE STATE ----------
  // Stores the actual list of items in the cart. Private so it cannot be modified directly from outside.
  final List<CartItem> _items = [];

  // ---------- PUBLIC GETTERS ----------
  // Exposes the list safely. List.unmodifiable prevents external code from adding or removing items directly.
  List<CartItem> get items => List.unmodifiable(_items);

  // Returns the total number of unique items (rows) in the cart.
  int get itemCount => _items.length;

  // Calculates total count of all items combined (e.g., 2 apples + 3 bananas = 5 items).
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  // Calculates total price by summing up the subtotals of all individual items.
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.subtotal);

  // Formats the total price as a clean string currency display (e.g., "Rs. 1500").
  String get formattedTotal => 'Rs. ${totalPrice.toStringAsFixed(0)}';

  // Quick check to see if the cart is completely empty.
  bool get isEmpty => _items.isEmpty;

  // ---------- BUSINESS LOGIC ----------

  /// Add a product to the cart. If it already exists, increase its quantity.
  void addProduct(Products product) {
    // Search for a matching product ID in the current cart list.
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index == -1) {
      // If index is -1, it means the product is not in the cart yet. Add it as a new item.
      _items.add(CartItem(product: product, quantity: 0));
    } else {
      // If the product is found, replace the old item with a new copy that has an increased quantity.
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    }
    notifyListeners(); // Notify the UI that the cart state has changed so it can rebuild.
  }

  /// Increase the quantity of a specific item already present in the cart.
  void increaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      notifyListeners(); // Refresh UI
    }
  }

  /// Decrease the quantity of an item. If its quantity drops to 0, completely remove it.
  void decreaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final newQty = _items[index].quantity - 1;
      if (newQty <= 0) {
        // If the quantity drops to zero or below, remove the item row entirely.
        _items.removeAt(index);
      } else {
        // Otherwise, update the item with the reduced quantity.
        _items[index] = _items[index].copyWith(quantity: newQty);
      }
      notifyListeners(); // Refresh UI
    }
  }

  /// Completely remove a specific product from the cart regardless of its quantity.
  void removeProduct(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners(); // Refresh UI
  }

  /// Wipe out all items, resetting the shopping cart to empty.
  void clearCart() {
    _items.clear();
    notifyListeners(); // Refresh UI
  }

  /// Helper method to quickly check if a specific product is already present in the cart.
  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }
}
