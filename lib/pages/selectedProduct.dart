import 'package:burgheran/services/product.dart';
import 'package:flutter/material.dart';

class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;

  _SelectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        foregroundColor: Colors.black,
        title: Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '₱ ${totalAmount.toString()}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),

              Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if (numberOfOrders > 1){
                        numberOfOrders -=1;
                        totalAmount = product.price * numberOfOrders;
                      }
                    });
                  },
                      icon: Icon(Icons.remove)
                  ),
                  Text(
                      numberOfOrders.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          numberOfOrders +=   1;
                          totalAmount = product.price * numberOfOrders;
                        });
                      },

                      icon: Icon(Icons.add)
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
