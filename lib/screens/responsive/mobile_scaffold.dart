import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/util/container_list_widget.dart';
import 'package:school_management_frontend/util/message_list_widget.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Dashboard'),
        backgroundColor: AppColors.green,
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
                      backgroundColor: AppColors.green,
                      child: const Text(
                        'RS',
                        style: TextStyle(color: Colors.white),
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

              // Assignments Section
              Text(
                'Assignments',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),

              // Grid View for Assignments
              GridView.builder(
                shrinkWrap: true, // Important for SingleChildScrollView
                physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8, // Adjusted for better text display
                ),
                itemBuilder: (context, index) {
                  return ContainerListWidget(
                    title: 'Math Homework - Algebra',
                    subject: 'Mathematics',
                    dueDate: '21 Oct 2025',
                  );
                },
              ),
              const SizedBox(height: 24),

              // Messages Section
              Text(
                'Messages',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),

              // Messages List
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