abstract class Product {
  final String name;
  final double price;
  int _quantity;

  Product({required this.name, required this.price, this._quantity = 1});
  int get quantity => _quantity;
  double get totalPrice => price * _quantity;
  void increaseQuantity() {
    _quantity++;
  }

  bool decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      return true;
    }
    return false;
  }

  String getDescription();
}
