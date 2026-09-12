import 'package:flutter/material.dart';
import 'package:product_manager/models/electronic_prouct.dart';
import 'package:product_manager/models/food_product.dart';
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
    FoodProduct(
      name: 'Apple',
      price: 150,
      quantity: 2,
      expiryDate: '2026-10-01',
    ),
    FoodProduct(
      name: 'Milk',
      price: 250,
      quantity: 1,
      expiryDate: '2026-09-15',
    ),
    ElectronicProduct(
      name: 'Headphones',
      price: 3500,
      quantity: 1,
      warrantyMonths: 12,
    ),
    ElectronicProduct(
      name: 'Mouse',
      price: 1200,
      quantity: 2,
      warrantyMonths: 6,
    ),
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
      products[index].decreaseQuantity();
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      products[index].increaseQuantity();
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final productss = products[index];
                  return Card(
                    color: Colors.blue.shade100,
                    child: ListTile(
                      title: Text(productss.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productss.getDescription()),
                          Text(
                            '${productss.price} x ${productss.quantity} = ${productss.totalPrice}',
                          ),
                        ],
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
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (var p in products) {
                      if (p is FoodProduct) {
                        p.applyDiscount(10);
                      }
                    }
                  });
                },
                child: const Text('apply 10% dis on food'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
