import 'package:flutter/material.dart';
import 'package:school_management_frontend/layouts/responsive_scaffolds.dart';
import 'package:school_management_frontend/new/assignment_card_ui.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/new/message_card_ui.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class StudentDashboard extends StatelessWidget {
   StudentDashboard({super.key});
   
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
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final bool isDesktop = MediaQuery.of(context).size.width >= 1200;

    final Widget bodyContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveScaffolds.profileSection(
          name: 'Rahul Sharma',
          classInfo: 'Class 10th - A | Roll No: 25',
        ),
        
        const SizedBox(height: 24),
        
        ResponsiveScaffolds.sectionHeader(
          title: 'Assignments',
          showCount: true,
          count: assignments.where((a) => !a['isCompleted']).length,
          subtitle: 'Pending',
        ),
        const SizedBox(height: 16),
        
        ResponsiveScaffolds.gridLayout(
          itemCount: assignments.length,
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return AssignmentCardUI(
              title: assignment['title'],
              subject: assignment['subject'],
              dueDate: assignment['dueDate'],
              isCompleted: assignment['isCompleted'],
              themeColor: AppColors.green,
              isMobile: isMobile,
              isTablet: !isMobile && !isDesktop,
              isDesktop: isDesktop,
            );
          },
        ),
        
        const SizedBox(height: 32),
        
        ResponsiveScaffolds.sectionHeader(
          title: 'Messages',
          showCount: true,
          count: messages.length,
          subtitle: 'Unread',
        ),
        const SizedBox(height: 16),
        
        ResponsiveScaffolds.listLayout(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageCardUI(
              sender: message['sender']!,
              message: message['message']!,
              time: message['time']!,
              isMobile: isMobile,
              isTablet: !isMobile && !isDesktop,
              isDesktop: isDesktop,
            );
          },
        ),
      ],
    );

    if (isMobile) {
      return ResponsiveScaffolds.mobileScaffold(
        title: 'Student Dashboard',
        body: bodyContent,
      );
    } else if (isDesktop) {
      return ResponsiveScaffolds.desktopScaffold(
        title: 'Student Dashboard',
        body: bodyContent,
        rightSidebar: ChatListScreen(),
      );
    } else {
      return ResponsiveScaffolds.tabletScaffold(
        title: 'Student Dashboard',
        body: bodyContent,
      );
    }
  }



}