import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/util/container_list_widget.dart';
import 'package:school_management_frontend/util/message_list_widget.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  // Assignments list with different data
  final List<Map<String, dynamic>> assignments = [
    {
      'title': 'Math Homework - Algebra',
      'subject': 'Mathematics',
      'dueDate': '21 Oct 2025',
      'isCompleted': false,
    },
    {
      'title': 'Science Project Report',
      'subject': 'Science',
      'dueDate': '23 Oct 2025',
      'isCompleted': true,
    },
    {
      'title': 'Essay on Environment',
      'subject': 'English',
      'dueDate': '25 Oct 2025',
      'isCompleted': false,
    },
    {
      'title': 'History Notes Completion',
      'subject': 'History',
      'dueDate': '26 Oct 2025',
      'isCompleted': false,
    },
    {
      'title': 'Physics Lab Experiment',
      'subject': 'Physics',
      'dueDate': '28 Oct 2025',
      'isCompleted': true,
    },
    {
      'title': 'Chemistry Formulas',
      'subject': 'Chemistry',
      'dueDate': '30 Oct 2025',
      'isCompleted': false,
    },
    {
      'title': 'Geography Map Work',
      'subject': 'Geography',
      'dueDate': '01 Nov 2025',
      'isCompleted': false,
    },
    {
      'title': 'Computer Programming',
      'subject': 'Computer Science',
      'dueDate': '03 Nov 2025',
      'isCompleted': true,
    },
  ];

  // Messages list with different data
  final List<Map<String, String>> messages = [
    {
      'sender': 'Mr. Sharma',
      'message': 'Math assignment submission tomorrow',
      'time': '10:30 AM',
    },
    {
      'sender': 'Ms. Kanika',
      'message': 'English essay topic changed',
      'time': 'Yesterday',
    },
    {
      'sender': 'School Admin',
      'message': 'PTM scheduled for next week',
      'time': '2 days ago',
    },
    {
      'sender': 'Mrs. Anjali',
      'message': 'Science project guidelines',
      'time': '3 days ago',
    },
    {
      'sender': 'Mr. Sahil',
      'message': 'History notes completion reminder',
      'time': '1 week ago',
    },
    {
      'sender': 'Mr. Gupta',
      'message': 'Physics lab timing changed',
      'time': '1 week ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar Navigation
            Expanded(
              flex: 1,
              child: SidebarNavigation(),
            ),

            // Main Content Area
            Expanded(
              flex: 3,
              child: SingleChildScrollView( // Use SingleChildScrollView instead of CustomScrollView
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Profile Section
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.green,
                              child: const Text(
                                'RS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rahul Sharma',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Class 10th - A | Roll No: 25',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Assignments Section
                      Text(
                        'Assignments',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),

                      // Grid View for Assignments - Fixed height
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: assignments.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.1, // Better aspect ratio for desktop
                        ),
                        itemBuilder: (context, index) {
                          final assignment = assignments[index];
                          return ContainerListWidget(
                            title: assignment['title'],
                            subject: assignment['subject'],
                            dueDate: assignment['dueDate'],
                            isCompleted: assignment['isCompleted'],
                          );
                        },
                      ),
                      const SizedBox(height: 32),

                      // Messages Section
                      Text(
                        'Messages',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),

                      // Messages List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return MessageListWidget(
                            sender: message['sender']!,
                            message: message['message']!,
                            time: message['time']!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Right Sidebar (for additional content)
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuickActionItem('Know Your Teacher', Icons.person),
                      _buildQuickActionItem('Assignment', Icons.assignment),
                      _buildQuickActionItem('Timetable', Icons.schedule),
                      _buildQuickActionItem('Syllabus', Icons.menu_book),
                      _buildQuickActionItem('Announcements', Icons.announcement),
                      const SizedBox(height: 12),
                      _buildQuickActionItem('Logout', Icons.logout, Colors.red),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem(String title, IconData icon, [Color? color]) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color ?? AppColors.green),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // Handle action tap
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}