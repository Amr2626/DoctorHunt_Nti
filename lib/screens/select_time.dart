import 'package:doctorapp/screens/Done_screen.dart';
import 'package:flutter/material.dart';

class Select2Time extends StatefulWidget {
  const Select2Time({super.key});

  @override
  State<Select2Time> createState() => Select2TimeState();
}

class Select2TimeState extends State<Select2Time> {
  final String doctorName = "Dr. Shruti Kedia";
  final String clinicName = "Upasana Dental Clinic, Salt Lake";
  final double rating = 4.0;
  final String todayLabel = "Today, 7 Jun";
  final String tomorrowLabel = "Tomorrow, 8 Jun";

  final List<String> todayAfternoonSlots = [];
  final List<String> todayEveningSlots = [];

  final List<String> tomorrowAfternoonSlots = [
    "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM"
  ];
  final List<String> tomorrowEveningSlots = [
    "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM"
  ];

  String selectedDate = "Tomorrow, 8 Jun";
  String? selectedSlot = "2:00 PM";

  @override
  Widget build(BuildContext context) {
    List<String> getAfternoonSlots() {
      if (selectedDate == todayLabel) return todayAfternoonSlots;
      return tomorrowAfternoonSlots;
    }

    List<String> getEveningSlots() {
      if (selectedDate == todayLabel) return todayEveningSlots;
      return tomorrowEveningSlots;
    }

    int totalSlots = getAfternoonSlots().length + getEveningSlots().length;

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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              clinicName,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),

            Row(
              children: [
                Expanded(
                  child: DateSlot(
                    label: todayLabel,
                    slotsAvailable: 0,
                    isSelected: selectedDate == todayLabel,
                    onTap: () {
                      setState(() {
                        selectedDate = todayLabel;
                        selectedSlot = null;
                      });
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DateSlot(
                    label: tomorrowLabel,
                    slotsAvailable: 9,
                    isSelected: selectedDate == tomorrowLabel,
                    onTap: () {
                      setState(() {
                        selectedDate = tomorrowLabel;
                        if (!tomorrowAfternoonSlots.contains(selectedSlot) &&
                            !tomorrowEveningSlots.contains(selectedSlot)) {
                          selectedSlot = null;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            if (totalSlots == 0)
              Container(
                padding: EdgeInsets.symmetric(vertical: 32),
                alignment: Alignment.center,
                child: Text(
                  "No slots available",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            else ...[
              if (getAfternoonSlots().isNotEmpty) ...[
                Text(
                  "Afternoon (${getAfternoonSlots().length} available)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: getAfternoonSlots().map((slot) {
                    final bool isSelected = slot == selectedSlot;
                    return _TimeSlotChip(
                      label: slot,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedSlot = slot;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],
              if (getEveningSlots().isNotEmpty) ...[
                Text(
                  "Evening (${getEveningSlots().length} available)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: getEveningSlots().map((slot) {
                    final bool isSelected = slot == selectedSlot;
                    return _TimeSlotChip(
                      label: slot,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedSlot = slot;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],
            ],

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (selectedSlot != null && totalSlots > 0)
                    ? () {
                        Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) =>doneScreen()),
                );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF27AE60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
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
  final VoidCallback onTap;

  const DateSlot({super.key, 
    required this.label,
    required this.slotsAvailable,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasSlots = slotsAvailable > 0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF27AE60).withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF27AE60) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isSelected ? Color(0xFF27AE60) : Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              hasSlots
                  ? "$slotsAvailable slots available"
                  : "No slots available",
              style: TextStyle(
                color: hasSlots
                    ? Color(0xFF27AE60)
                    : Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeSlotChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF27AE60),
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: isSelected,
      selectedColor: Color(0xFF27AE60),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? Color(0xFF27AE60) : Color(0xFF27AE60).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      onSelected: (_) => onTap(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}
