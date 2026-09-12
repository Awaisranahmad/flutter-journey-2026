import 'package:product_manager/models/discountable.dart';

import 'product.dart';

class FoodProduct extends Product with Discountable {
  final String expiryDate;
  FoodProduct({
    required super.name,
    required super.price,
    int quantity = 1,
    required this.expiryDate,
  });
  @override
  String getDescription() {
    return '$name (Food, expires: $expiryDate)';
  }

  @override
  double get totalPrice => applyTo(super.totalPrice * 0.98);
}
