import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/util/container_list_widget.dart';
import 'package:school_management_frontend/util/message_list_widget.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  // Step 1: List of assignments
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Dashboard'),
        backgroundColor: AppColors.green, // theme color
      ),
      drawer:  SidebarNavigation(),
      body: SingleChildScrollView( // Unified scrolling for entire page
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.green,
                      child: const Text(
                        'RS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rahul Sharma',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Class 10th - A | Roll No: 25',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Assignments Section Title
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Assignments',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              // 🔹 Assignments Grid - Responsive
              LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate responsive columns based on screen width
                  final crossAxisCount = constraints.maxWidth > 700 ? 2 : 1;
                  return GridView.builder(
                    shrinkWrap: true, // Important for SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                    itemCount: assignments.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.8, // Better aspect ratio for content
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
                  );
                },
              ),

              const SizedBox(height: 24),

              // 🔹 Messages Section
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Messages',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              // 🔹 Messages List
              ListView.builder(
                shrinkWrap: true, // Important for SingleChildScrollView
                physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MessageListWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}