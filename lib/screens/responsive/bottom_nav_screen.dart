import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/chat.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/notification.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/profile.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/timetable.dart';
import 'package:school_management_frontend/screens/responsive/mobile_scaffold.dart';
import 'package:school_management_frontend/screens/responsive/tablet_scaffold.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 2;

  Widget _getScreen() {
    final screenWidth = MediaQuery.of(context).size.width;

    switch (_currentIndex) {
      case 0:
        return const Timetable();
      case 1:
        return const ChatScreen();
      case 2:
        if (screenWidth < 650) {
          return const MobileScaffold(showBottomNav: false);
        } else {
          return const TabletScaffold(showBottomNav: false);
        }
      case 3:
        return const NotificationScreen();
      case 4:
        return const ProfileScreen();
      default:
        if (screenWidth < 650) {
          return const MobileScaffold(showBottomNav: false);
        } else {
          return const TabletScaffold(showBottomNav: false);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show bottom navigation if not on index 2
    final showBottomNav = _currentIndex != 2;
    return Scaffold(
      body: _getScreen(),
      bottomNavigationBar: showBottomNav
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