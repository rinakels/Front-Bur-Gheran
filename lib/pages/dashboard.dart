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
      backgroundColor: Colors.brown [300],
      body: Container(
        child: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/menu');
              },
              child: Text('Go to Menu'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Go to Profile'),
            ),

          ],
        ),
        ),
      ),
    );

  }
}
