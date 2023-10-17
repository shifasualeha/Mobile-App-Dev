// product_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';
import 'product.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 1, name: 'Milk Pack', price: 500),
    Product(id: 2, name: 'Juices', price: 150),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<CartProvider>(
                  builder: (ctx, cart, child) {
                    final isItemInCart = cart.cartItems.contains(product);
                    return ElevatedButton(
                      onPressed: isItemInCart
                          ? () {
                              cart.removeFromCart(product);
                            }
                          : () {
                              cart.addToCart(product);
                            },
                      child: Text(isItemInCart ? 'Remove' : 'Add'),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
