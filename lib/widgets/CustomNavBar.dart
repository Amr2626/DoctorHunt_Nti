import 'package:doctorapp/screens/favourite%20doctors.dart';
import 'package:doctorapp/screens/find_dactor_screen.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    FindDoctor(),
    FavouriteDoctors(),
    Center(child: Text('Chat Page')),
  ];

  void onIconTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => onIconTap(0),
                child: CircleAvatar(
                  backgroundColor: selectedIndex == 0
                      ? Color(0xFF27AE60)
                      : Colors.transparent,
                  radius: 24,
                  child: Icon(
                    Icons.home,
                    color: selectedIndex == 0 ? Colors.white : Colors.grey[500],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onIconTap(1),
                child: CircleAvatar(
                  backgroundColor: selectedIndex == 1
                      ? Color(0xFF27AE60)
                      : Colors.transparent,
                  radius: 24,
                  child: Icon(
                    Icons.favorite,
                    color: selectedIndex == 1 ? Colors.white : Colors.grey[500],
                    size: 28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onIconTap(2),
                child: CircleAvatar(
                  backgroundColor: selectedIndex == 2
                      ? Color(0xFF27AE60)
                      : Colors.transparent,
                  radius: 24,
                  child: Icon(
                    Icons.menu_book,
                    color: selectedIndex == 2 ? Colors.white : Colors.grey[500],
                    size: 28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onIconTap(3),
                child: CircleAvatar(
                  backgroundColor: selectedIndex == 3
                      ? Color(0xFF27AE60)
                      : Colors.transparent,
                  radius: 24,
                  child: Icon(
                    Icons.chat_bubble,
                    color: selectedIndex == 3 ? Colors.white : Colors.grey[500],
                    size: 28,
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
