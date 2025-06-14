import 'package:doctorapp/widgets/CustomNavBar.dart' as customNavBar;
import 'package:doctorapp/widgets/custom_image_start.dart';
import 'package:flutter/material.dart';

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA), 
      body: Stack(
        children: [
          Positioned(
            left: -120,
            top: -20,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xFF27AE60), 
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                 gradient: RadialGradient(
                 center: Alignment.bottomRight,
                 radius: 1,
                 colors: [
               Color.fromARGB(241, 145, 214, 140),              
               Color.fromARGB(0, 244, 245, 249),             
    ],
  ),
),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                ImageStart(),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Find Trusted Doctors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
               
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
                  child: Column(
                    children: [
                       SizedBox(
                        height: 54,
                        width: 295,
                         child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => customNavBar.NavigationBar()),
                              );
                             
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF27AE60),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                       ),
                      
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF27AE60),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
