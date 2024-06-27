import 'package:burgheran/services/menuCard.dart';
import 'package:burgheran/services/product.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Double Longganisa Burger", price: 45.99),
    Product(productName: "Cheese Burger", price: 39.99),
    Product(productName: "Chicken Burger", price: 57.99),
    Product(productName: "Regular Burger", price: 29.99),
    Product(productName: "Double Patty Burger", price: 44.99),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        foregroundColor: Colors.black,
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}
