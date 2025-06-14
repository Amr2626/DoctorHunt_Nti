import 'package:doctorapp/widgets/CustomNavBar.dart' as customNavBar;
import 'package:flutter/material.dart';

class doneScreen extends StatelessWidget {
  final String doctorName;
  final String date;
  final String time;

  const doneScreen({
    super.key,
    this.doctorName = "Dr. Pediatrician Purpiseon",
    this.date = "February 21, 2021",
    this.time = "02:00 PM",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Appointment",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60).withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "February 2021",
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60).withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(32),
              child: const Icon(
                Icons.thumb_up_alt_rounded,
                color: Color(0xFF27AE60),
                size: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Thank You!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "You booked an appointment with $doctorName on $date, at $time.",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => customNavBar.NavigationBar()),
                              );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27AE60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
              },
              child: const Text(
                "Edit your appointment",
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
