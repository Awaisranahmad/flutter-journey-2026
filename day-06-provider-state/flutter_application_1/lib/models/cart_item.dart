import 'package:flutter_application_1/models/products.dart';

class CartItem {
  final Products _product;
  final int _quantity;

  CartItem({required this._product, required this._quantity});
  Products get product => _product;
  int get quantity => _quantity;

  double get subtotal => _product.price * _quantity;
  String get formattedSubtotal => 'Rs ${subtotal.toStringAsFixed(0)}';

  CartItem copyWith({int? quantity}) {
    return CartItem(product: _product, quantity: quantity ?? _quantity);
  }
}
