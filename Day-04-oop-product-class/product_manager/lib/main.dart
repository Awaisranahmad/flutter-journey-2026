import 'package:flutter/material.dart';
import 'package:product_manager/models/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Manager',
      home: const ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [
    Product(name: 'apple', price: 12, quantity: 3),
    Product(name: 'Milk', price: 250, quantity: 1),
    Product(name: 'Bread', price: 120, quantity: 3),
  ];
  double _calculatedGrandTotal() {
    double total = 0;
    for (var product in products) {
      total += product.totalPrice;
    }
    return total;
  }

  void _increaseQuantity(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (products[index].quantity > 1) {
        products[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
        actions: [
          Padding(
            padding: const EdgeInsetsGeometry.all(16),
            child: Text(
              'Rs. ${_calculatedGrandTotal().toString()}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, int index) {
            final product = products[index];
            return Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(product.name, style: const TextStyle(fontSize: 18)),

                subtitle: Text(
                  'Rs. ${product.price} x ${product.quantity} = ${product.totalPrice}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => _decreaseQuantity(index),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '${product.quantity}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                      ),
                      onPressed: () => _increaseQuantity(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
