import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/admissions/admission_form.dart';
import 'package:school_management_frontend/screens/assignments/assignment_list_screen.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/student_dashboard.dart';
import 'package:school_management_frontend/screens/attendence/attendence.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/notification.dart';
import 'package:school_management_frontend/screens/sidebar_screens/syllabus.dart';
import 'package:school_management_frontend/screens/sidebar_screens/teachers.dart';
import 'package:school_management_frontend/screens/sidebar_screens/timetable.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';


class SidebarNavigation extends StatelessWidget {
  final bool asDrawer;

  SidebarNavigation({super.key, this.asDrawer = true});

  // Drawer items with titles, icons, and the corresponding pages
  final List<Map<String, dynamic>> _drawerItems = [
    {
      'title': 'Know Your Teacher',
      'icon': Icons.person,
      'page': const KnowYourTeachersScreen(),
      'color': Colors.blue
    },
    {
      'title': 'Assignment',
      'icon': Icons.assignment,
      'page': const AssignmentListScreen(),
      'color': Colors.green
    },
    {
      'title': 'Timetable',
      'icon': Icons.schedule,
      'page': const TimetableScreen(),
      'color': Colors.orange
    },
    {
      'title': 'Syllabus',
      'icon': Icons.menu_book,
      'page': const SyllabusScreen(),
      'color': Colors.purple
    },
    {
      'title': 'Announcements',
      'icon': Icons.announcement,
      'page': const NotificationScreen(),
      'color': Colors.blue
    },
    {
      'title': 'Fee',
      'icon': Icons.payment,
      'page': const StudentDashboard(),
      'color': Colors.red
    },
    {
      'title': 'Attendance',
      'icon': Icons.check_circle,
      'page': const AttendanceScreen(),
      'color': Colors.teal
    },
    {
      'title': 'Calendar',
      'icon': Icons.calendar_month,
      'page': const StudentDashboard(),
      'color': Colors.indigo
    },
    {
      'title': 'Transport',
      'icon': Icons.directions_bus,
      'page': const StudentDashboard(),
      'color': Colors.brown
    },
     {
      'title': 'Admissions',
      'icon': Icons.how_to_reg,
      'page': const AdmissionForm(),
      'color': Colors.lightBlue
    },
    {
      'title': 'Library',
      'icon': Icons.library_books,
      'page': const StudentDashboard(),
      'color': Colors.pink
    },
    {
      'title': 'Reports',
      'icon': Icons.analytics,
      'page': const StudentDashboard(),
      'color': Colors.cyan
    },
  ];

  void _handleNavigation(BuildContext context, Widget page) {
    Navigator.pop(context); // close drawer
    
    // If the page is StudentDashboard or NotificationScreen, navigate to BottomNavbar with appropriate index
    if (page is StudentDashboard) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavbar(
            currentIndex: 2,
            onIndexChanged: (index) {
              if (index != 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavbar(
                      currentIndex: index,
                      onIndexChanged: (index) {},
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
    } else if (page is NotificationScreen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavbar(
            currentIndex: 3,
            onIndexChanged: (index) {
              if (index != 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavbar(
                      currentIndex: index,
                      onIndexChanged: (index) {},
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  void _handleLogout(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Add logout logic here
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[50]!,
            ],
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            _buildDrawerHeader(),
            const SizedBox(height: 8),
            Expanded(child: _buildNavigationItems(context)),
          ],
        ),
    );

    if (asDrawer) {
      return Drawer(
        width: 280,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        elevation: 10,
        child: content,
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 280),
      child: content,
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.green,
            AppColors.green.withOpacity(0.8),
            Colors.teal[400]!,
          ],
        ),
        borderRadius: const BorderRadius.only(topRight: Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white70],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.green,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Rahul Sharma',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Class 10th - A',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Roll No: 25',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: _drawerItems.length + 1, // add 1 for logout
        itemBuilder: (context, index) {
          if (index < _drawerItems.length) {
            final item = _drawerItems[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _handleNavigation(context, item['page']),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(item['icon'], color: item['color'], size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400], size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          // logout item at the end
          return _buildLogoutSection(context);
        },
      ),
    );
  }

  Widget _buildLogoutSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleLogout(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.logout, color: Colors.red, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                ),
                Icon(Icons.chevron_right,
                    color: Colors.red.withOpacity(0.6), size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
