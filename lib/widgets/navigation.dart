import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/students/student_dashboard.dart';
import 'package:school_management_frontend/screens/attendence/attendence.dart';
import 'package:school_management_frontend/screens/attendence/show_attendence.dart';
import 'package:school_management_frontend/screens/teachers/teacher_dashboard.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart'; // New import

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _getCurrentScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.green,
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Students',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Teachers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'More',
            ),
          ],
        ),
      ),
      drawer: SidebarNavigation(), // Using separate sidebar class
    );
  }

  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return StudentDashboard();
      case 1:
        return AttendanceScreen();
      case 2:
        return MonthlyAttendanceReportScreen();
      case 3:
        return TeacherDashboard();
      case 4:
        return _buildMoreScreen();
      default:
        return StudentDashboard();
    }
  }

  Widget _buildMoreScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'More Options',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          // More Options
          Column(
            children: _moreOptions.map((option) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Icon(option['icon'], color: AppColors.green),
                  title: Text(option['title']),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle option tap
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> _moreOptions = [
    {'title': 'Notices', 'icon': Icons.announcement},
    {'title': 'Homework', 'icon': Icons.assignment},
    {'title': 'Timetable', 'icon': Icons.schedule},
    {'title': 'Events', 'icon': Icons.event},
    {'title': 'Gallery', 'icon': Icons.photo_library},
    {'title': 'Settings', 'icon': Icons.settings},
  ];
}