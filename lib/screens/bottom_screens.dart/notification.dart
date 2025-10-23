import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Dummy notifications
  final List<Map<String, String>> notifications = const [
    {"title": "New Assignment", "subtitle": "Math homework is due tomorrow."},
    {"title": "Event Reminder", "subtitle": "Parent-teacher meeting at 5 PM."},
    {"title": "Notice", "subtitle": "School will be closed on Friday."},
    {"title": "Sports Day", "subtitle": "Annual sports day on 15th December."},
    {"title": "Fee Reminder", "subtitle": "Last date for fee submission is 25th."},
    {"title": "Exam Schedule", "subtitle": "Final exams starting from next week."},
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
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
      ),
      body: _buildNotificationsContent(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
      ),
      body: _buildNotificationsContent(),
    );
  }

  // Desktop Layout
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

            // Main Content
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Desktop Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: const Row(
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Notifications Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildNotificationsContent(isDesktop: true),
                    ),
                  ),
                ],
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

  // Common Notifications Content
  Widget _buildNotificationsContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    double padding;
    double titleFontSize;
    double subtitleFontSize;
    double iconSize;
    double cardMargin;

    if (screenWidth < 500) {
      // Mobile
      padding = 16;
      titleFontSize = 16;
      subtitleFontSize = 14;
      iconSize = 24;
      cardMargin = 8;
    } else if (screenWidth < 1000) {
      // Tablet
      padding = 20;
      titleFontSize = 18;
      subtitleFontSize = 15;
      iconSize = 28;
      cardMargin = 12;
    } else {
      // Desktop
      padding = 24;
      titleFontSize = 20;
      subtitleFontSize = 16;
      iconSize = 32;
      cardMargin = 16;
    }

    return ListView.builder(
      padding: EdgeInsets.all(padding),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: EdgeInsets.only(bottom: cardMargin),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              notification["title"]!,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              notification["subtitle"]!,
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: Colors.grey[600],
              ),
            ),
            leading: Icon(
              Icons.notifications,
              color: AppColors.green,
              size: iconSize,
            ),
            tileColor: AppColors.green.withOpacity(0.05),
            contentPadding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 20 : 16,
              vertical: isDesktop ? 12 : 8,
            ),
          ),
        );
      },
    );
  }
}