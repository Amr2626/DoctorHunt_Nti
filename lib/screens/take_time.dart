import 'package:doctorapp/screens/select_time.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    final String doctorName = "Dr. Shruti Kedia";
    final String clinicName = "Upasana Dental Clinic, salt lake";
    final double rating = 4.0;
    final String todayLabel = "Today, 7 Jun";
    final String tomorrowLabel = "Tomorrow, 8 Jun";
    final String nextAvailableLabel = "Next availability on Sun, 8 Jun";

    final List<Map<String, dynamic>> dateSlots = [
      {
        'label': todayLabel,
        'slotsAvailable': 0,
        'isSelected': false,
      },
      {
        'label': tomorrowLabel,
        'slotsAvailable': 9,
        'isSelected': true,
      },
      {
        'label': "Sun, 9 Jun",
        'slotsAvailable': 5,
        'isSelected': false,
      },
      {
        'label': "Mon, 10 Jun",
        'slotsAvailable': 2,
        'isSelected': false,
      },
      {
        'label': "Tue, 11 Jun",
        'slotsAvailable': 0,
        'isSelected': false,
      },
      {
        'label': "Wed, 12 Jun",
        'slotsAvailable': 3,
        'isSelected': false,
      },
      {
        'label': "Thu, 13 Jun",
        'slotsAvailable': 1,
        'isSelected': false,
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Select Time",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, size: 32, color: Colors.grey[600]),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        clinicName,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),

            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: dateSlots.length,
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final slot = dateSlots[index];
                  return DateSlot(
                    label: slot['label'],
                    slotsAvailable: slot['slotsAvailable'],
                    isSelected: slot['isSelected'],
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    "Today, 7 Jun",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "No slots available",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),

            Column(
  children: [
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>Select2Time()
          )
           );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF27AE60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          nextAvailableLabel,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    SizedBox(height: 20),
    Center(
      child: Text('OR', 
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
    SizedBox(height: 20),
    SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF27AE60), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          "Contact Clinic",
          style: TextStyle(
            color: Color(0xFF27AE60),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    ),
  ],
),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class DateSlot extends StatelessWidget {
  final String label;
  final int slotsAvailable;
  final bool isSelected;

  const DateSlot({super.key, 
    required this.label,
    required this.slotsAvailable,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasSlots = slotsAvailable > 0;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(255, 3, 247, 3).withOpacity(0.08) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Color(0xFF27AE60) : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      width: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isSelected ? Color(0xFF27AE60) : Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              hasSlots
                  ? "$slotsAvailable slots available"
                  : "No slots available",
              style: TextStyle(
                color: hasSlots
                    ? Color(0xFF27AE60)
                    : Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
