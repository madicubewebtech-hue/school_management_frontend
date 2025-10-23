// import 'package:flutter/material.dart';
// import 'package:school_management_frontend/theme/app_colors.dart';
// import 'package:school_management_frontend/util/container_list_widget.dart';
// import 'package:school_management_frontend/util/message_list_widget.dart';
// import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

// class MobileScaffold extends StatefulWidget {
//   const MobileScaffold({super.key});

//   @override
//   State<MobileScaffold> createState() => _MobileScaffoldState();
// }

// class _MobileScaffoldState extends State<MobileScaffold> {

//   // Step 1: List of assignments
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
//   ];

//    // Messages list with different data
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
//       appBar: AppBar(
//         title: const Text('Mobile Dashboard'),
//         backgroundColor: AppColors.green,
//       ),
//       drawer:  SidebarNavigation(),
//       body: SingleChildScrollView( // Unified scrolling for entire page
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User Profile Section
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: AppColors.green.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: AppColors.green,
//                       child: const Text(
//                         'RS',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Rahul Sharma',
//                             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                           Text(
//                             'Class 10th - A | Roll No: 25',
//                             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                                   color: Colors.grey[600],
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Assignments Section
// // Assignments Section
// Text(
//   'Assignments',
//   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//         color: AppColors.green,
//         fontWeight: FontWeight.bold,
//       ),
// ),
// const SizedBox(height: 12),

// // FIXED GridView - No overflow guarantee
// GridView.count(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   crossAxisCount: 2,
//   crossAxisSpacing: 10,
//   mainAxisSpacing: 10,
//   childAspectRatio: 1.1, // Perfect for 100px height
//   children: assignments.map((assignment) {
//     return PerfectFitContainerWidget(
//       title: assignment['title'],
//       subject: assignment['subject'],
//       dueDate: assignment['dueDate'],
//       isCompleted: assignment['isCompleted'],
//       themeColor: AppColors.green,
//     );
//   }).toList(),
// ),

// const SizedBox(height: 24),

//               // Messages Section
//               Text(
//                 'Messages',
//                 style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       color: AppColors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               const SizedBox(height: 12),

//               // Messages List
//               ListView.builder(
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
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }