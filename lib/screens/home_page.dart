import 'package:doctorapp/screens/start_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
       onTap: () {
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startPage()),
       );
      },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 161, 208, 240),
          Color.fromARGB(255, 162, 226, 161),
        ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Image.asset(
          'assets/Vector.png',
          width: 100,
          height: 100,
        ),
        SizedBox(height: 10),
        Text(
          'Doctor Hunt',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
            ],
          ),
        ),
      )
    );
  }
}