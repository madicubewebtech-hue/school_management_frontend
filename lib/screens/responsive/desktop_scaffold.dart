// import 'package:flutter/material.dart';
// import 'package:school_management_frontend/theme/app_colors.dart';
// import 'package:school_management_frontend/util/container_list_widget.dart';
// import 'package:school_management_frontend/util/message_list_widget.dart';
// import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

// class DesktopScaffold extends StatefulWidget {
//   const DesktopScaffold({super.key});

//   @override
//   State<DesktopScaffold> createState() => _DesktopScaffoldState();
// }

// class _DesktopScaffoldState extends State<DesktopScaffold> {
//   // Assignments list with different data
//   final List<Map<String, dynamic>> assignments = [
//     {
//       'title': 'Math Homework - Algebra',
//       'subject': 'Mathematics',
//       'dueDate': '21 Oct 2025',
//       'isCompleted': false,
//     },
//     {
//       'title': 'Science Project Report',
//       'subject': 'Science',
//       'dueDate': '23 Oct 2025',
//       'isCompleted': true,
//     },
//     {
//       'title': 'Essay on Environment',
//       'subject': 'English',
//       'dueDate': '25 Oct 2025',
//       'isCompleted': false,
//     },
//     {
//       'title': 'History Notes Completion',
//       'subject': 'History',
//       'dueDate': '26 Oct 2025',
//       'isCompleted': false,
//     },
//     {
//       'title': 'Physics Lab Experiment',
//       'subject': 'Physics',
//       'dueDate': '28 Oct 2025',
//       'isCompleted': true,
//     },
//     {
//       'title': 'Chemistry Formulas',
//       'subject': 'Chemistry',
//       'dueDate': '30 Oct 2025',
//       'isCompleted': false,
//     },
//     {
//       'title': 'Geography Map Work',
//       'subject': 'Geography',
//       'dueDate': '01 Nov 2025',
//       'isCompleted': false,
//     },
//     {
//       'title': 'Computer Programming',
//       'subject': 'Computer Science',
//       'dueDate': '03 Nov 2025',
//       'isCompleted': true,
//     },
//   ];

//   // Messages list with different data
//   final List<Map<String, String>> messages = [
//     {
//       'sender': 'Mr. Sharma',
//       'message': 'Math assignment submission tomorrow',
//       'time': '10:30 AM',
//     },
//     {
//       'sender': 'Ms. Kanika',
//       'message': 'English essay topic changed',
//       'time': 'Yesterday',
//     },
//     {
//       'sender': 'School Admin',
//       'message': 'PTM scheduled for next week',
//       'time': '2 days ago',
//     },
//     {
//       'sender': 'Mrs. Anjali',
//       'message': 'Science project guidelines',
//       'time': '3 days ago',
//     },
//     {
//       'sender': 'Mr. Sahil',
//       'message': 'History notes completion reminder',
//       'time': '1 week ago',
//     },
//     {
//       'sender': 'Mr. Gupta',
//       'message': 'Physics lab timing changed',
//       'time': '1 week ago',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Row(
//           children: [
//             // Sidebar Navigation
//             Expanded(
//               flex: 1,
//               child: SidebarNavigation(),
//             ),

//             // Main Content Area
//             Expanded(
//               flex: 3,
//               child: SingleChildScrollView( // Use SingleChildScrollView instead of CustomScrollView
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // User Profile Section
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: AppColors.green.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: AppColors.green,
//                               child: const Text(
//                                 'RS',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Rahul Sharma',
//                                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                   ),
//                                   Text(
//                                     'Class 10th - A | Roll No: 25',
//                                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                           color: Colors.grey[600],
//                                         ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),

//                       // Assignments Section
//                       Text(
//                         'Assignments',
//                         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                               color: AppColors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       const SizedBox(height: 16),

//                       // Grid View for Assignments - Fixed height
//   // FIXED GridView for Desktop
// // In DesktopScaffold, update the GridView to:
// GridView.builder(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   itemCount: assignments.length,
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 3, // 3 columns for desktop
//     crossAxisSpacing: 20,
//     mainAxisSpacing: 20,
//     childAspectRatio: 1.5,
//   ),
//   itemBuilder: (context, index) {
//     final assignment = assignments[index];
//     return _buildAssignmentCard(assignment); // Same card widget as tablet
//   },
// ),
//                       // Messages Section
//                       Text(
//                         'Messages',
//                         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                               color: AppColors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       const SizedBox(height: 16),

//                       // Messages List
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: messages.length,
//                         itemBuilder: (context, index) {
//                           final message = messages[index];
//                           return MessageListWidget(
//                             sender: message['sender']!,
//                             message: message['message']!,
//                             time: message['time']!,
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Right Sidebar (for additional content)
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.grey[50],
//                 padding: const EdgeInsets.all(16),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Quick Actions',
//                         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       const SizedBox(height: 16),
//                       _buildQuickActionItem('Know Your Teacher', Icons.person),
//                       _buildQuickActionItem('Assignment', Icons.assignment),
//                       _buildQuickActionItem('Timetable', Icons.schedule),
//                       _buildQuickActionItem('Syllabus', Icons.menu_book),
//                       _buildQuickActionItem('Announcements', Icons.announcement),
//                       const SizedBox(height: 12),
//                       _buildQuickActionItem('Logout', Icons.logout, Colors.red),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickActionItem(String title, IconData icon, [Color? color]) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 8),
//       child: ListTile(
//         leading: Icon(icon, color: color ?? AppColors.green),
//         title: Text(
//           title,
//           style: TextStyle(
//             color: color ?? Colors.black87,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         onTap: () {
//           // Handle action tap
//         },
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }


//   Widget _buildAssignmentCard(Map<String, dynamic> assignment) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//         border: Border.all(
//           color: AppColors.green.withOpacity(0.2),
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Subject and Status
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: AppColors.green.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     assignment['subject'],
//                     style: TextStyle(
//                       color: AppColors.green,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: assignment['isCompleted'] 
//                         ? Colors.green.withOpacity(0.1)
//                         : Colors.orange.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     assignment['isCompleted'] ? 'Done' : 'Pending',
//                     style: TextStyle(
//                       color: assignment['isCompleted'] ? Colors.green : Colors.orange,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             // Title
//             Text(
//               assignment['title'],
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),

//             const Spacer(),

//             // Due Date
//             Row(
//               children: [
//                 Icon(
//                   Icons.calendar_today,
//                   size: 16,
//                   color: Colors.grey[600],
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Due: ${assignment['dueDate']}',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
