
import 'package:doctorapp/screens/Done_screen.dart';
import 'package:flutter/material.dart';

class AppointmentCalendar extends StatefulWidget {
  const AppointmentCalendar({super.key});

  @override
  State<AppointmentCalendar> createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<AppointmentCalendar> {
  final int year = 2025;
  final int month = 6; 
  int selectedDay = 7;

  final List<String> timeSlots = [
    "10:00 AM",
    "12:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
  ];
  int selectedTimeIndex = 2;

  final List<String> reminderOptions = [
    "30 minutes",
    "40 minutes",
    "25 minutes",
    "10 minutes",
    "35 minutes",
  ];
  int selectedReminderIndex = 2;

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Text(
            "June 2025",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _CalendarWidget(
            year: year,
            month: month,
            selectedDay: selectedDay,
            onDaySelected: (day) {
              setState(() {
                selectedDay = day;
              });
            },
          ),
          const SizedBox(height: 28),
          const Text(
            "Available Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(timeSlots.length, (index) {
              final isSelected = index == selectedTimeIndex;
              return ChoiceChip(
                label: Text(
                  timeSlots[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF27AE60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                selectedColor: const Color(0xFF27AE60),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isSelected
                        ? const Color(0xFF27AE60)
                        : const Color(0xFF27AE60).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                onSelected: (_) {
                  setState(() {
                    selectedTimeIndex = index;
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              );
            }),
          ),
          const SizedBox(height: 28),
          const Text(
            "Remind Me Before",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(reminderOptions.length, (index) {
              final isSelected = index == selectedReminderIndex;
              return ChoiceChip(
                label: Text(
                  reminderOptions[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF27AE60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                selectedColor: const Color(0xFF27AE60),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isSelected
                        ? const Color(0xFF27AE60)
                        : const Color(0xFF27AE60).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                onSelected: (_) {
                  setState(() {
                    selectedReminderIndex = index;
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              );
            }),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) =>doneScreen()),
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
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  final int year;
  final int month;
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const _CalendarWidget({
    required this.year,
    required this.month,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final firstWeekday = DateTime(year, month, 1).weekday; 

    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    List<Widget> dayWidgets = [];
    for (int i = 1; i < firstWeekday; i++) {
      dayWidgets.add(Container());
    }
    for (int day = 1; day <= daysInMonth; day++) {
      final isSelected = day == selectedDay;
      dayWidgets.add(
        GestureDetector(
          onTap: () => onDaySelected(day),
          child: Container(
            margin: const EdgeInsets.all(4),
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF27AE60) : Colors.white,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                color: isSelected ? const Color(0xFF27AE60) : Colors.grey[300]!,
                width: isSelected ? 2 : 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysOfWeek
              .map((d) => Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 6),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dayWidgets,
        ),
      ],
    );
  }
}
