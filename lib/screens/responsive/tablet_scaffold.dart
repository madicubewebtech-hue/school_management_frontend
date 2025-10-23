// import 'package:flutter/material.dart';
// import 'package:school_management_frontend/theme/app_colors.dart';
// import 'package:school_management_frontend/util/message_list_widget.dart';
// import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

// class TabletScaffold extends StatefulWidget {
//   const TabletScaffold({super.key});

//   @override
//   State<TabletScaffold> createState() => _TabletScaffoldState();
// }

// class _TabletScaffoldState extends State<TabletScaffold> {
//   // Assignments list
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

//   // Messages list
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
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tablet Dashboard'),
//         backgroundColor: AppColors.green,
//       ),
//       drawer: SidebarNavigation(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User Profile Section - Improved
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: AppColors.green.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: AppColors.green,
//                       child: const Text(
//                         'RS',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Rahul Sharma',
//                             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.green,
//                                 ),
//                           ),
//                           Text(
//                             'Class 10th - A | Roll No: 25',
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                   color: Colors.grey[600],
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Assignments Section
//               Row(
//                 children: [
//                   Text(
//                     'Assignments',
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           color: AppColors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const Spacer(),
//                   Text(
//                     '${assignments.where((a) => !a['isCompleted']).length} Pending',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Improved GridView for Tablet - Better spacing
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: assignments.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // 2 columns for better tablet view
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   childAspectRatio: 1.6, // Wider boxes
//                 ),
//                 itemBuilder: (context, index) {
//                   final assignment = assignments[index];
//                   return _buildAssignmentCard(assignment);
//                 },
//               ),
//               const SizedBox(height: 32),

//               // Messages Section
//               Row(
//                 children: [
//                   Text(
//                     'Messages',
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           color: AppColors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const Spacer(),
//                   Text(
//                     '${messages.length} Unread',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: AppColors.green,
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Messages List
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[50],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index];
//                     return MessageListWidget(
//                       sender: message['sender']!,
//                       message: message['message']!,
//                       time: message['time']!,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// Widget _buildAssignmentCard(Map<String, dynamic> assignment) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           blurRadius: 10,
//           offset: const Offset(0, 4),
//         ),
//       ],
//       border: Border.all(
//         color: AppColors.green.withOpacity(0.2),
//         width: 1,
//       ),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Subject and Status - FIXED ROW
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible( // ✅ Use Flexible instead of Expanded
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Reduced padding
//                   decoration: BoxDecoration(
//                     color: AppColors.green.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     assignment['subject'],
//                     style: TextStyle(
//                       color: AppColors.green,
//                       fontSize: 10, // Smaller font
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8), // Add spacing
//               Flexible( // ✅ Use Flexible for status too
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: assignment['isCompleted'] 
//                         ? Colors.green.withOpacity(0.1)
//                         : Colors.orange.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     assignment['isCompleted'] ? 'Done' : 'Pending',
//                     style: TextStyle(
//                       color: assignment['isCompleted'] ? Colors.green : Colors.orange,
//                       fontSize: 10, // Smaller font
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           // Title - FIXED HEIGHT
//           SizedBox(
//             height: 48, // Fixed height for title
//             child: Text(
//               assignment['title'],
//               style: const TextStyle(
//                 fontSize: 15, // Slightly smaller
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),

//           const Spacer(),

//           // Due Date - FIXED
//           Row(
//             children: [
//               Icon(
//                 Icons.calendar_today,
//                 size: 14, // Smaller icon
//                 color: Colors.grey[600],
//               ),
//               const SizedBox(width: 6),
//               Flexible( // ✅ Use Flexible for date text
//                 child: Text(
//                   'Due: ${assignment['dueDate']}',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 12, // Smaller font
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }