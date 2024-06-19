import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Bur-Gheran'),
        ),

        backgroundColor: Colors.amber[700],
      ),//AppBar
      body: Center(
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6zqkscZwA-9A-ciGdwQh_1bzGaIaLg4MNSA&s')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber[700],
        child: Icon(
          Icons.ac_unit_outlined,
          color: Colors.black87,
        ),
      ),
    ),  //Scaffold
  ));  // MaterialApp
}


