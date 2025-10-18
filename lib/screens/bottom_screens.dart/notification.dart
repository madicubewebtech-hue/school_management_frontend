import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  // Dummy notifications
  final List<Map<String, String>> notifications = const [
    {"title": "New Assignment", "subtitle": "Math homework is due tomorrow."},
    {"title": "Event Reminder", "subtitle": "Parent-teacher meeting at 5 PM."},
    {"title": "Notice", "subtitle": "School will be closed on Friday."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Center(child: Text('Notifications', style: TextStyle(color: Colors.white ,),)),
        backgroundColor: AppColors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(notification["title"]!),
              subtitle: Text(notification["subtitle"]!),
              leading: const Icon(Icons.notifications, color: AppColors.green),
              tileColor: AppColors.green.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }
}
