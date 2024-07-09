import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Dashboard',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown [300],
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Center(
          child: Image.asset(
          'assets/burgerr.png',
            width: 360,
          ),
        ),
          SizedBox(height: 20.0,),
          ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/menu');
          },
            child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown,
          ),
        ),

          SizedBox(height: 20.0,),
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown,
              ),
            ),
          ),
          ],
        ),
      ),
    ),
    );
  }
}