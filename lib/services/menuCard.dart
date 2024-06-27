import 'package:flutter/material.dart';
import 'package:burgheran/services/product.dart';


class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[300],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text(product.productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,

              ),
            ),
            Text('${product.price}',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
