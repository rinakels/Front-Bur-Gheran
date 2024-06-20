import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('USER PROFILE'),
      backgroundColor: Colors.brown[300],
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            'NAME',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              letterSpacing: 2.0,

            ),

          ),
          Text(
            'Rinalyn V.Oriendo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'YEAR',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              letterSpacing: 2.0,

            ),

          ),
          Text(
            'Third',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'EMAIL',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              letterSpacing: 2.0,

            ),

          ),
          Text(
            'oriendovalencia@gmail.com',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    ),

),
));

