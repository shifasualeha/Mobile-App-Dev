// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';
//import 'product.dart';
import 'listScreen.dart';
import 'cartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping Cart App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductListScreen(),
          '/cart': (ctx) => CartScreen(),
        },
      ),
    );
  }
}
