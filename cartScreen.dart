import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';
//import 'product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.cartItems;

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.name),
            subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cart.removeFromCart(cartItem);
                  },
                  child: Text('Remove'),
                ),
                Text(cartItem.quantity.toString()),
                ElevatedButton(
                  onPressed: () {
                    cart.addToCart(cartItem);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total: \$${cart.totalCost.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}