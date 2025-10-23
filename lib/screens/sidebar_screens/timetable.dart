import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive logic
    if (screenWidth < 500) {
      return _buildMobileLayout(context);
    } else if (screenWidth < 1000) {
      return _buildTabletLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  // Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavbar()),
            );
          },
        ),
        title: const Text('Class Timetable', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      body: _buildTimetableContent(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavbar()),
            );
          },
        ),
        title: const Text('Class Timetable', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      body: _buildTimetableContent(),
    );
  }

  // Desktop Layout - FIXED
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Left Sidebar
            Expanded(
              flex: 1,
              child: SidebarNavigation(),
            ),

            // Main Content - FIXED: SingleChildScrollView को बाहर ले जाएं
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Desktop Header
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: const Row(
                        children: [
                          Text(
                            'Class Timetable',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Timetable Content - FIXED: Padding के अंदर
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildTimetableContent(isDesktop: true),
                    ),
                    const SizedBox(height: 24), // Bottom spacing
                  ],
                ),
              ),
            ),

            // Right Sidebar
            Expanded(
              flex: 1,
              child: ChatListScreen(),
            ),
          ],
        ),
      ),
    );
  }

  // Common Timetable Content - FIXED
  Widget _buildTimetableContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    double cellWidth;
    double headerFontSize;
    double cellFontSize;
    double padding;

    if (screenWidth < 500) {
      // Mobile
      cellWidth = 90;
      headerFontSize = 14;
      cellFontSize = 12;
      padding = 12;
    } else if (screenWidth < 1000) {
      // Tablet
      cellWidth = 110;
      headerFontSize = 15;
      cellFontSize = 13;
      padding = 16;
    } else {
      // Desktop
      cellWidth = 120; // Reduced for better fit
      headerFontSize = 16;
      cellFontSize = 14;
      padding = 16;
    }

    return Container(
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
        child: Container(
          constraints: BoxConstraints(
            minWidth: isDesktop ? MediaQuery.of(context).size.width * 0.5 : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    _buildHeaderCell('Time', cellWidth, headerFontSize, isFirst: true),
                    _buildHeaderCell('Mon', cellWidth, headerFontSize),
                    _buildHeaderCell('Tue', cellWidth, headerFontSize),
                    _buildHeaderCell('Wed', cellWidth, headerFontSize),
                    _buildHeaderCell('Thu', cellWidth, headerFontSize),
                    _buildHeaderCell('Fri', cellWidth, headerFontSize),
                    _buildHeaderCell('Sat', cellWidth, headerFontSize, isLast: true),
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
                      _buildCell(row['time'], cellWidth, cellFontSize, bold: true),
                      _buildCell(row['Mon'], cellWidth, cellFontSize),
                      _buildCell(row['Tue'], cellWidth, cellFontSize),
                      _buildCell(row['Wed'], cellWidth, cellFontSize),
                      _buildCell(row['Thu'], cellWidth, cellFontSize),
                      _buildCell(row['Fri'], cellWidth, cellFontSize),
                      _buildCell(row['Sat'], cellWidth, cellFontSize),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // Header cell widget
  Widget _buildHeaderCell(String text, double width, double fontSize,
      {bool isFirst = false, bool isLast = false}) {
    return Container(
      width: width,
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
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  // Normal cell widget
  Widget _buildCell(String text, double width, double fontSize, {bool bold = false}) {
    final isBreak = text.toLowerCase() == 'break';
    return Container(
      width: width,
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
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: isBreak ? Colors.orange[800] : Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}