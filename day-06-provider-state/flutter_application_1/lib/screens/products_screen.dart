import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/products.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
import '../providers/cart_provider.dart';
// import '../widgets/product_card.dart';/
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  // Sample products
  static const List<Products> _products = [
    Products(id: 'p1', name: 'Apple', price: 150, emoji: '🍎'),
    Products(id: 'p2', name: 'Milk', price: 250, emoji: '🥛'),
    Products(id: 'p3', name: 'Bread', price: 120, emoji: '🍞'),
    Products(id: 'p4', name: 'Cheese', price: 450, emoji: '🧀'),
    Products(id: 'p5', name: 'Orange Juice', price: 320, emoji: '🧃'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // Cart icon with badge (Consumer se live count)
          Consumer<CartProvider>(
            builder: (context, cart, _) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      );
                    },
                  ),
                  if (cart.totalQuantity > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          '${cart.totalQuantity}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ProductCard(
            product: product,
            onAdd: () {
              // context.read = ek dafa action ke liye (rebuild nahi karta)
              context.read<CartProvider>().addProduct(product);

              // Confirmation snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart'),
                  duration: const Duration(milliseconds: 800),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
