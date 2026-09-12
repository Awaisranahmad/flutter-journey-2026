import 'product.dart';

class ElectronicProuct extends Product {
  final int warrantyMonths;
  ElectronicProuct({
    required super.name,
    required super.price,
    super.quantity = 1,
    required this.warrantyMonths,
  });
  @override
  double get totalPrice {
    double base = super.totalPrice;
    return base * 1.05;
  }
}
