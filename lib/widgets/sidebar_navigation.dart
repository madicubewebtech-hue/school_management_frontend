import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/admissions/admission_form.dart';
import 'package:school_management_frontend/screens/assignments/assignment_list_screen.dart';
import 'package:school_management_frontend/screens/students/student_dashboard.dart';
import 'package:school_management_frontend/screens/attendence/attendence.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class SidebarNavigation extends StatelessWidget {
  SidebarNavigation({super.key});

  final List<Map<String, dynamic>> _drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard', 'color': Colors.blue},
    {'title': 'My Profile', 'icon': Icons.person, 'route': '/profile', 'color': Colors.green},
    {'title': 'Admissions', 'icon': Icons.class_, 'route': '/admissions', 'color': Colors.orange},
    {'title': 'Subjects', 'icon': Icons.book, 'route': '/subjects', 'color': Colors.purple},
    {'title': 'Assignments', 'icon': Icons.assignment, 'route': '/assignments', 'color': Colors.blue},
    {'title': 'Exams', 'icon': Icons.quiz, 'route': '/exams', 'color': Colors.red},
    {'title': 'Attendance', 'icon': Icons.assignment_turned_in, 'route': '/attendance', 'color': Colors.teal},
    {'title': 'Fees', 'icon': Icons.payment, 'route': '/fees', 'color': Colors.indigo},
    {'title': 'Transport', 'icon': Icons.directions_bus, 'route': '/transport', 'color': Colors.brown},
    {'title': 'Library', 'icon': Icons.library_books, 'route': '/library', 'color': Colors.pink},
    {'title': 'Reports', 'icon': Icons.analytics, 'route': '/reports', 'color': Colors.cyan},
  ];

  void _handleNavigation(BuildContext context, String route) {
    Navigator.pop(context);
    Widget screen;
    switch (route) {
      case '/dashboard':
        screen = const StudentDashboard();
        break;
      case '/profile':
        screen = const StudentDashboard ();
        break;
      case '/admissions':
        screen = const AdmissionForm();
        break;
      case '/subjects':
        screen = const StudentDashboard();
        break;
        case '/assignments':
        screen = const AssignmentListScreen();
        break;
      case '/exams':
        screen = const StudentDashboard();
        break;
      case '/attendance':
        screen = const AttendanceScreen();
        break;
      case '/fees':
        screen = const StudentDashboard();
        break;
      case '/transport':
        screen = const StudentDashboard();
        break;
      case '/library':
        screen = const StudentDashboard();
        break;
      case '/reports':
        screen = const StudentDashboard();
        break;
      default:
        screen = const StudentDashboard();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
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
              // Add logout logic
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
    return Drawer(
      width: 280,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      elevation: 10,
      child: Container(
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
            // Header with curved design
            _buildDrawerHeader(),
            
            // // User Info Card
            // _buildUserInfoCard(),
            
            const SizedBox(height: 8),
            
            // Navigation Items
            Expanded(
              child: _buildNavigationItems(context),
            ),
            
            // Logout Section
            _buildLogoutSection(context),
          ],
        ),
      ),
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
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            top: 10,
            right: 10,
            child: Opacity(
              opacity: 0.1,
              child: Icon(
                Icons.school,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         color: Colors.white.withOpacity(0.2),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: Icon(
                //         Icons.school,
                //         color: Colors.white,
                //         size: 28,
                //       ),
                //     ),
                //     const SizedBox(width: 12),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Demo Public School',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //               shadows: [
                //                 Shadow(
                //                   blurRadius: 4,
                //                   color: Colors.black.withOpacity(0.2),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           const SizedBox(height: 4),
                //           Text(
                //             'Student Portal',
                //             style: TextStyle(
                //               color: Colors.white.withOpacity(0.9),
                //               fontSize: 12,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
           Row(
         
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
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
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
              
              children: [
                Text(
                  'Rahul Sharma',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Class 10th - A',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Roll No: 25',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
  
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildUserInfoCard() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //       border: Border.all(
  //         color: Colors.grey.withOpacity(0.2),
  //       ),
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 50,
  //           height: 50,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             gradient: LinearGradient(
  //               colors: [AppColors.green, Colors.teal],
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //             ),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: AppColors.green.withOpacity(0.3),
  //                 blurRadius: 8,
  //                 offset: const Offset(0, 4),
  //               ),
  //             ],
  //           ),
  //           child: const Icon(
  //             Icons.person,
  //             color: Colors.white,
  //             size: 24,
  //           ),
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Rahul Sharma',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.grey[800],
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 'Class 10th - A',
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   color: Colors.grey[600],
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  //                 decoration: BoxDecoration(
  //                   color: AppColors.green.withOpacity(0.1),
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 child: Text(
  //                   'Roll No: 25',
  //                   style: TextStyle(
  //                     fontSize: 10,
  //                     color: AppColors.green,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildNavigationItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: _drawerItems.length,
        itemBuilder: (context, index) {
          final item = _drawerItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _handleNavigation(context, item['route']),
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
                        child: Icon(
                          item['icon'],
                          color: item['color'],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey[400],
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
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
              border: Border.all(
                color: Colors.red.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.red.withOpacity(0.6),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}