import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';


class BottomNavbar extends StatefulWidget {
  final Function(int) onIndexChanged;
  final int currentIndex;

  const BottomNavbar({
    super.key, 
    required this.onIndexChanged,
    this.currentIndex = 2,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: AppColors.green,
      index: widget.currentIndex,
      animationDuration: const Duration(milliseconds: 300),
      onTap: widget.onIndexChanged,
      items: const [
        Icon(Icons.schedule, color: Colors.white),
        Icon(Icons.chat, color: Colors.white),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.notifications, color: Colors.white),
        Icon(Icons.person, color: Colors.white),
      ],
    );
  }
}
