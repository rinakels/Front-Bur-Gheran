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
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 400,
                  height: 300,
                  child: Image.network(
                      product.url,
                    fit: BoxFit.cover,
                  ),
              ),
              SizedBox(height: 5.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.product.productName,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                  ),
                  SizedBox(height: 2.0,)

                ],
              ),
              Text(widget.product.description,
              textAlign: TextAlign.center,),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '₱ ${totalAmount.toStringAsFixed(2)}',
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
