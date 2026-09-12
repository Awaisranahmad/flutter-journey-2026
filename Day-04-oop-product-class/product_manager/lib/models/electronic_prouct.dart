import 'product.dart';

class ElectronicProduct extends Product {
  final int warrantyMonths;
  ElectronicProduct({
    required super.name,
    required super.price,
    super.quantity = 1,
    required this.warrantyMonths,
  });
  @override
  String getDescription() {
    return '$name (Electronics, $warrantyMonths month warranty)';
  }

  @override
  double get totalPrice {
    double base = super.totalPrice;
    return base * 1.05;
  }
}
