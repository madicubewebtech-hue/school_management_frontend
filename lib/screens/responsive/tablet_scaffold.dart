import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/chat.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/notification.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/profile.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/student_dashboard.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/timetable.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class TabletScaffold extends StatefulWidget {
  final bool showBottomNav;
  const TabletScaffold({super.key, this.showBottomNav = true});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  int _currentIndex = 2;

  Widget _getScreen() {
    switch (_currentIndex) {
      case 0:
        return const Timetable();
      case 1:
        return const ChatScreen();
      case 2:
        return const StudentDashboard();
      case 3:
        return const NotificationScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const StudentDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarNavigation(),
          Expanded(
            child: _getScreen(),
          ),
        ],
      ),
      bottomNavigationBar: widget.showBottomNav
          ? BottomNavbar(
              currentIndex: _currentIndex,
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}