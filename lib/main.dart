import 'package:burgheran/home.dart';
import 'package:burgheran/pages/dashboard.dart';
import 'package:burgheran/pages/menu.dart';
import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
  },
));



