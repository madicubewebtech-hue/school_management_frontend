import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school_management_frontend/new/chat/chat_list_screen.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class ResponsiveScaffolds {
  // Enhanced AppBar
static PreferredSizeWidget enhancedAppBar({required bool isWeb}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(isWeb ? 140 : 120),
      child: Builder(
        builder: (context) {
          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.width;

          return AppBar(
            toolbarHeight: isWeb ? 140 : 120,
            backgroundColor: AppColors.green,
            automaticallyImplyLeading: false,
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.green,
                    AppColors.green.withOpacity(0.9),
                    AppColors.green.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: MediaQuery.of(context).padding.top + (isWeb ? 30 : 24),
                bottom: 16,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Logo with enhanced design
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          borderRadius: BorderRadius.circular(50),
                          splashColor: Colors.white30,
                          highlightColor: Colors.white24,
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/school_logo.png',
                              height: isWeb ? 48 : 40,
                              width: isWeb ? 48 : 40,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                Icons.school_rounded,
                                size: isWeb ? 42 : 36,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // School name with enhanced typography
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Demo Public School",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isWeb ? 26 : 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            minFontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Excellence in Education",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: isWeb ? 14 : 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Optional: Add some action icons for web
                    if (isWeb) ...[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 28,
                        ),
                        tooltip: 'Notifications',
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        tooltip: 'Search',
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Mobile Layout Template - UPDATED
  static Widget mobileScaffold({
    required String title,
    required Widget body,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: enhancedAppBar(isWeb: false),
      drawer: SidebarNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
    );
  }

  // Tablet Layout Template - UPDATED  
  static Widget tabletScaffold({
    required String title,
    required Widget body,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: enhancedAppBar(isWeb: true),
      drawer: SidebarNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: body,
        ),
      ),
    );
  }

  // Desktop Layout Template - UPDATED
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
              child: sidebar ?? SidebarNavigation(),
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
                child: rightSidebar,
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