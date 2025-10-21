import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  // Dummy timetable data
  final List<Map<String, dynamic>> timetable = const [
    {
      'time': '8:00 - 8:45',
      'Mon': 'Maths',
      'Tue': 'English',
      'Wed': 'Science',
      'Thu': 'History',
      'Fri': 'Maths',
      'Sat': 'Sports',
    },
    {
      'time': '8:45 - 9:30',
      'Mon': 'English',
      'Tue': 'Science',
      'Wed': 'Maths',
      'Thu': 'Civics',
      'Fri': 'Geography',
      'Sat': 'Drawing',
    },
    {
      'time': '9:30 - 10:15',
      'Mon': 'Physics',
      'Tue': 'Chemistry',
      'Wed': 'Biology',
      'Thu': 'Maths',
      'Fri': 'Computer',
      'Sat': 'Library',
    },
    {
      'time': '10:15 - 10:30',
      'Mon': 'Break',
      'Tue': 'Break',
      'Wed': 'Break',
      'Thu': 'Break',
      'Fri': 'Break',
      'Sat': 'Break',
    },
    {
      'time': '10:30 - 11:15',
      'Mon': 'Science',
      'Tue': 'History',
      'Wed': 'Geography',
      'Thu': 'English',
      'Fri': 'Civics',
      'Sat': 'Maths',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavbar()),
                            );
          },
        ),
        title: const Text('Class Timetable', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                // Header Row
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildHeaderCell('Time', isWeb, isFirst: true),
                      _buildHeaderCell('Mon', isWeb),
                      _buildHeaderCell('Tue', isWeb),
                      _buildHeaderCell('Wed', isWeb),
                      _buildHeaderCell('Thu', isWeb),
                      _buildHeaderCell('Fri', isWeb),
                      _buildHeaderCell('Sat', isWeb, isLast: true),
                    ],
                  ),
                ),

                // Data Rows
                ...timetable.map((row) {
                  int index = timetable.indexOf(row);
                  return Container(
                    color: index % 2 == 0 ? Colors.grey[50] : Colors.white,
                    child: Row(
                      children: [
                        _buildCell(row['time'], isWeb, bold: true),
                        _buildCell(row['Mon'], isWeb),
                        _buildCell(row['Tue'], isWeb),
                        _buildCell(row['Wed'], isWeb),
                        _buildCell(row['Thu'], isWeb),
                        _buildCell(row['Fri'], isWeb),
                        _buildCell(row['Sat'], isWeb),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header cell widget
  Widget _buildHeaderCell(String text, bool isWeb,
      {bool isFirst = false, bool isLast = false}) {
    return Container(
      width: isWeb ? 120 : 90,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(16) : Radius.zero,
          topRight: isLast ? const Radius.circular(16) : Radius.zero,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  // Normal cell widget
  Widget _buildCell(String text, bool isWeb, {bool bold = false}) {
    final isBreak = text.toLowerCase() == 'break';
    return Container(
      width: isWeb ? 120 : 90,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.withOpacity(0.2)),
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        color: isBreak ? Colors.yellow[100] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: isBreak ? Colors.orange[800] : Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
