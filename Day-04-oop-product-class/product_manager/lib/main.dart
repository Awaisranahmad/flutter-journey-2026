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
      debugShowCheckedModeBanner: false,
      title: 'Product Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListPage(),
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
    Product(name: 'Apple', price: 23),
    Product(name: 'Lemon', price: 233),
  ];

  double _calculateGrandTotal() {
    double total = 0;
    for (var product in products) {
      total += product.totalPrice;
    }
    return total;
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (products[index].quantity > 1) {
        products[index].quantity--;
      }
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text('Rs ${_calculateGrandTotal().toStringAsFixed(0)}'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final productss = products[index];
            return Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(productss.name),
                subtitle: Text(
                  '${productss.price} x ${productss.quantity} = ${productss.totalPrice}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => _decreaseQuantity(index),
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '${productss.quantity}',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _increaseQuantity(index),
                      icon: Icon(Icons.add_circle_outline, color: Colors.green),
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
