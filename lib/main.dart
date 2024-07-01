import 'package:burgheran/home.dart';
import 'package:burgheran/pages/dashboard.dart';
import 'package:burgheran/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:burgheran/pages/signup.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/signup',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => Signup(),
  },
));



