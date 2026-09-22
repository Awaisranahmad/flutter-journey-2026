import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_tile.dart';

/// Screen that displays the user's shopping cart, total pricing,
/// and options to update quantities, remove items, or clear the cart.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ---------- CONSUMER WIDGET ----------
    // Listens for changes in CartProvider and rebuilds the UI automatically
    // whenever the state updates (e.g., items added, removed, or quantity changed).
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            actions: [
              // Show the "Clear Cart" button in the AppBar only if the cart is not empty
              if (!cart.isEmpty)
                IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  tooltip: 'Clear cart',
                  onPressed: () => _confirmClear(context, cart),
                ),
            ],
          ),
          // Toggle view: Display empty placeholder if cart is empty, otherwise show cart content
          body: cart.isEmpty
              ? _buildEmptyState()
              : _buildCartContent(context, cart),
        );
      },
    );
  }

  // ---------- EMPTY STATE UI ----------
  /// Renders a placeholder UI when there are no items in the cart.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Add some products to get started!',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ---------- MAIN CART CONTENT ----------
  /// Renders the scrollable list of cart items and the checkout summary box.
  Widget _buildCartContent(BuildContext context, CartProvider cart) {
    return Column(
      children: [
        // ---------- SCROLLABLE ITEM LIST ----------
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return CartItemTile(
                item: item,
                // Callback functions passed to the child widget (CartItemTile)
                onIncrease: () => cart.increaseQuantity(item.product.id),
                onDecrease: () => cart.decreaseQuantity(item.product.id),
                onRemove: () => _confirmRemove(
                  context,
                  cart,
                  item.product.id,
                  item.product.name,
                ),
              );
            },
          ),
        ),

        // ---------- CHECKOUT SUMMARY SECTION ----------
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Total quantity row
              _summaryRow('Items', '${cart.totalQuantity}'),
              const SizedBox(height: 6),
              // Total price row
              _summaryRow(
                'Total',
                cart.formattedTotal,
                isBold: true,
                fontSize: 18,
              ),
              const SizedBox(height: 12),
              // Checkout action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _checkout(context, cart),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------- HELPER WIDGET: SUMMARY ROW ----------
  /// Helper method to create key-value text pairs for the checkout summary.
  Widget _summaryRow(
    String label,
    String value, {
    bool isBold = false,
    double fontSize = 14,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: isBold ? Colors.black : Colors.grey.shade700,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // ---------- DIALOG: REMOVE SINGLE ITEM ----------
  /// Shows a confirmation dialog before removing a single product from the cart.
  void _confirmRemove(
    BuildContext context,
    CartProvider cart,
    String productId,
    String productName,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Remove item?'),
        content: Text('Remove "$productName" from cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cart.removeProduct(productId);
              Navigator.pop(dialogContext); // Close dialog
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  // ---------- DIALOG: CLEAR ALL ITEMS ----------
  /// Shows a confirmation dialog before emptying the entire cart.
  void _confirmClear(BuildContext context, CartProvider cart) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Clear cart?'),
        content: const Text('This will remove all items from your cart.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cart.clearCart();
              Navigator.pop(dialogContext); // Close dialog
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  // ---------- DIALOG: CHECKOUT & ORDER SUCCESS ----------
  /// Simulates checkout by displaying order summary and clearing the cart state.
  void _checkout(BuildContext context, CartProvider cart) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Order Placed! 🎉'),
        content: Text(
          'Total: ${cart.formattedTotal}\n'
          'Items: ${cart.totalQuantity}\n\n'
          'Thank you for shopping!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              cart.clearCart();
              Navigator.pop(dialogContext); // Close dialog
              Navigator.pop(context); // Navigate back to previous screen
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
