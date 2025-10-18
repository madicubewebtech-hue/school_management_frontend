// import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:school_management_frontend/screens/bottom_screens.dart/student_dashboard.dart';
// import 'package:school_management_frontend/screens/attendence/attendence.dart';
// import 'package:school_management_frontend/screens/attendence/show_attendence.dart';
// import 'package:school_management_frontend/screens/teachers/teacher_dashboard.dart';
// import 'package:school_management_frontend/theme/app_colors.dart';
// import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({super.key});

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   int _currentIndex = 0;
//   double _commonFontSize = 12.0; // Common font size for all navigation items

//   final List<Map<String, dynamic>> _navItems = [
//     {'icon': Icons.dashboard, 'label': 'Dashboard'},
//     {'icon': Icons.assignment, 'label': 'Attendance'},
//     {'icon': Icons.people, 'label': 'Students'},
//     {'icon': Icons.school, 'label': 'Teachers'},
//     {'icon': Icons.menu, 'label': 'More'},
//   ];

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _calculateCommonFontSize();
//   }

//   void _calculateCommonFontSize() {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final itemWidth = screenWidth / _navItems.length;
    
//     // Calculate font size based on available width per item
//     // Longer text needs more space, so adjust accordingly
//     int maxTextLength = _getMaxTextLength();
//     double calculatedSize = (itemWidth / maxTextLength) * 3.5;
    
//     // Clamp between min and max sizes
//     _commonFontSize = calculatedSize.clamp(9.0, 12.0);
//   }

//   int _getMaxTextLength() {
//     int maxLength = 0;
//     for (var item in _navItems) {
//       if (item['label'].length > maxLength) {
//         maxLength = item['label'].length;
//       }
//     }
//     return maxLength;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[50],
//         body: _getCurrentScreen(),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 6),
//         child: Row(
//       children: List.generate(_navItems.length, (index) {
//         final item = _navItems[index];
//         final bool isSelected = _currentIndex == index;
      
//         return Expanded(
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   item['icon'],
//                   color: isSelected ? AppColors.green : Colors.grey[600],
//                   size: 24,
//                 ),
//                 const SizedBox(height: 4),
//                 // Using AutoSizeText to dynamically resize all labels together
//                 AutoSizeText(
//                   item['label'],
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   minFontSize: 8,
//                   maxFontSize: 12,
//                   group: AutoSizeGroup(), // This ensures all labels resize together
//                   style: TextStyle(
//                     color: isSelected ? AppColors.green : Colors.grey[600],
//                     fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//         ),
//       ),
//       drawer:  SidebarNavigation(),
//       ),
//     );
//   }

//   Widget _getCurrentScreen() {
//     switch (_currentIndex) {
//       case 0:
//         return const StudentDashboard();
//       case 1:
//         return const AttendanceScreen();
//       case 2:
//         return const MonthlyAttendanceReportScreen();
//       case 3:
//         return const TeacherDashboard();
//       case 4:
//         return _buildMoreScreen();
//       default:
//         return const StudentDashboard();
//     }
//   }

//   Widget _buildMoreScreen() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AutoSizeText(
//             'More Options',
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//             maxLines: 1,
//             minFontSize: 16,
//           ),
//           const SizedBox(height: 20),
//           Column(
//             children: _moreOptions.map((option) {
//               return Card(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 child: ListTile(
//                   leading: Icon(option['icon'], color: AppColors.green),
//                   title: AutoSizeText(
//                     option['title'],
//                     maxLines: 1,
//                     minFontSize: 12,
//                   ),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                   onTap: () {},
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   final List<Map<String, dynamic>> _moreOptions = [
//     {'title': 'Notices', 'icon': Icons.announcement},
//     {'title': 'Homework', 'icon': Icons.assignment},
//     {'title': 'Timetable', 'icon': Icons.schedule},
//     {'title': 'Events', 'icon': Icons.event},
//     {'title': 'Gallery', 'icon': Icons.photo_library},
//     {'title': 'Settings', 'icon': Icons.settings},
//   ];
// }