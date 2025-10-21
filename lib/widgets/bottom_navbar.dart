import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:school_management_frontend/main.dart';

import 'package:school_management_frontend/screens/bottom_screens.dart/chat.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/home.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/notification.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/profile.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/student_dashboard.dart';

import 'package:school_management_frontend/screens/bottom_screens.dart/timetable.dart';
import 'package:school_management_frontend/theme/app_colors.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // Default selected index is Home
  int _selectedIndex = 2;

  // Screens list
  final List<Widget> _screens = [
     Timetable(),
     ChatScreen(),
     StudentDashboard(),
     NotificationScreen(),
     ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body will show selected screen
      body: SafeArea(
        top: false, // We don't need SafeArea at top
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false, // Only bottom safe
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: AppColors.green,
          //Colors.teal.shade200,
          index: _selectedIndex,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            Icon(Icons.schedule, color: Colors.white),
            Icon(Icons.chat, color: Colors.white),
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.notifications, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
