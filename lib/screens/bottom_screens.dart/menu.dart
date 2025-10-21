import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/admissions/admission_form.dart';
import 'package:school_management_frontend/screens/assignments/assignment_list_screen.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/student_dashboard.dart';
import 'package:school_management_frontend/screens/attendence/attendence.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Drawer items list (same as SidebarNavigation but simplified design)
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Know Your Teacher',
      'icon': Icons.person,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Assignment',
      'icon': Icons.assignment,
      'page': const AssignmentListScreen(),
    },
    {
      'title': 'Timetable',
      'icon': Icons.schedule,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Syllabus',
      'icon': Icons.menu_book,
      'page': const StudentDashboard(),
    },
    {
      'title': 'Announcements',
      'icon': Icons.announcement,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Fee',
      'icon': Icons.payment,
      'page': const StudentDashboard(),
    },
    {
      'title': 'Attendance',
      'icon': Icons.check_circle,
      'page': const AttendanceScreen(),
    },
    {
      'title': 'Calendar',
      'icon': Icons.calendar_month,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Transport',
      'icon': Icons.directions_bus,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Admissions',
      'icon': Icons.how_to_reg,
      'page': const AdmissionForm(),
    },
    {
      'title': 'Library',
      'icon': Icons.library_books,
      'page': const BottomNavbar(),
    },
    {
      'title': 'Reports',
      'icon': Icons.analytics,
      'page': const BottomNavbar(),
    },
  ];

  void _navigateToPage(Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 15),
          children: <Widget>[
            SizedBox(
              height: 300,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 140),
                    Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: const DecoratedBox(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/icons/1.png'),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Dave Albert",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "View Profile",
                        style: TextStyle(fontSize: 17, color: Colors.white54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Build all menu items dynamically
            ..._menuItems.map((item) {
              return ListTile(
                leading: Icon(item['icon'], color: Colors.white),
                title: Text(
                  item['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () => _navigateToPage(item['page']),
              );
            }).toList(),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                "Logout",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content:
                        const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // TODO: Add logout logic
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
