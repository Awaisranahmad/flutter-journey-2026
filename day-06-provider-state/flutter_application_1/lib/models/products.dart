class Products {
  final String _id;
  final String _name;
  final double _price;
  final String _emoji;

  const Products({
    required this._emoji,
    required this._name,
    required this._price,
    required this._id,
  });

  String get id => _id;
  String get name => _name;
  double get price => _price;
  String get emoji => _emoji;
  String get formattedPrice => 'Rs. ${_price.toStringAsFixed(0)}';
}
