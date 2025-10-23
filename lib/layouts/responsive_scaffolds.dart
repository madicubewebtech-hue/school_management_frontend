import 'package:flutter/material.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/screens/bottom_screens.dart/chat.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class ResponsiveScaffolds {
  // Mobile Layout Template
  static Widget mobileScaffold({
    required String title,
    required Widget body,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.green,
        actions: actions,
      ),
      drawer:  SidebarNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
    );
  }

  // Tablet Layout Template  
  static Widget tabletScaffold({
    required String title,
    required Widget body,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.green,
        actions: actions,
      ),
      drawer:  SidebarNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: body,
        ),
      ),
    );
  }

  // Desktop Layout Template
  static Widget desktopScaffold({
    required String title,
    required Widget body,
    Widget? sidebar,
    Widget? rightSidebar,
  }) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Left Sidebar
            Expanded(
              flex: 1,
              child: sidebar ??  SidebarNavigation(),
            ),

            // Main Content
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: body,
                ),
              ),
            ),

            // Right Sidebar (Optional)
            if (rightSidebar != null)
              Expanded(
                flex: 1,
                child: ChatListScreen(),
              ),
          ],
        ),
      ),
    );
  }

  // Profile Section Template
  static Widget profileSection({
    required String name,
    required String classInfo,
    String avatarText = 'RS',
  }) {
    return Builder(
      builder: (context) {
        final bool isMobile = MediaQuery.of(context).size.width < 600;
        final bool isTablet = MediaQuery.of(context).size.width >= 600 && 
                            MediaQuery.of(context).size.width < 1200;
        
        return Container(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: AppColors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 20 : 30,
                backgroundColor: AppColors.green,
                child: Text(
                  avatarText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                    Text(
                      classInfo,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Section Header Template
  static Widget sectionHeader({
    required String title,
    String? subtitle,
    bool showCount = false,
    int? count,
  }) {
    return Builder(
      builder: (context) {
        final bool isMobile = MediaQuery.of(context).size.width < 600;
        
        return Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 18 : 24,
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
            const Spacer(),
            if (showCount && count != null)
              Text(
                '$count ${subtitle ?? ''}',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        );
      },
    );
  }

  // Grid Layout Template - UPDATED FOR DESKTOP
  static Widget gridLayout({
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return Builder(
      builder: (context) {
        final double screenWidth = MediaQuery.of(context).size.width;
        int crossAxisCount;
        double childAspectRatio;
        double spacing;

        if (screenWidth < 500) {
          // Mobile
          crossAxisCount = 2;
          childAspectRatio = 0.9;
          spacing = 12.0;
        } else if (screenWidth < 1000) {
          // Tablet
          crossAxisCount = 2;
          childAspectRatio = 1.3;
          spacing = 16.0;
        } else {
          // Desktop - More width for better layout
          crossAxisCount = 3;
          childAspectRatio = 1.1; // More vertical space for desktop
          spacing = 20.0;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: itemBuilder,
        );
      },
    );
  }

  // List Layout Template
  static Widget listLayout({
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}