import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class Timetable extends StatelessWidget {
  const Timetable({super.key});

  // Dummy timetable data
  final List<Map<String, String>> timetable = const [
    {"time": "09:00 AM - 10:00 AM", "subject": "Mathematics"},
    {"time": "10:00 AM - 11:00 AM", "subject": "Science"},
    {"time": "11:00 AM - 12:00 PM", "subject": "English"},
    {"time": "01:00 PM - 02:00 PM", "subject": "History"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('TimeTable', style: TextStyle(color: Colors.white ,),)),
        backgroundColor: AppColors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final entry = timetable[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(entry["subject"]!),
              subtitle: Text(entry["time"]!),
              leading: const Icon(Icons.schedule, color: AppColors.green,),
              tileColor: AppColors.green.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }
}
