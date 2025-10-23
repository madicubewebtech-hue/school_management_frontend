import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavbar()));
          },
        ),
        title: const Text('Announcements',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAnnouncementContent(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavbar()));
          },
        ),
        title: const Text('Announcements',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAnnouncementContent(),
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
                        'Announcements',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Announcement Content - FIXED HEIGHT
                Center(
                  child: Container(
                    width: 400, // Fixed width
                    height: 350, // Fixed height
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Colors.grey[50]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.green.withOpacity(0.3),
                          blurRadius: 25,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Animated Icon
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.green,
                                AppColors.green.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.green.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.campaign_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 25),
                        
                        // Title with gradient text
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              AppColors.green,
                              AppColors.green.withOpacity(0.7),
                            ],
                          ).createShader(bounds),
                          child: const Text(
                            'Announcements',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        // Subtitle
                        const Text(
                          'Feature is under development',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        
                        // Coming Soon text
                        Text(
                          'Coming Soon',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Animated progress bar
                        Container(
                          height: 6,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              // Animated progress
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.easeInOut,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.green,
                                      AppColors.green.withOpacity(0.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
  // Common Announcement Content
  Widget _buildAnnouncementContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    double containerWidth;
    double containerHeight;
    double padding;
    double iconSize;
    double iconContainerSize;
    double titleFontSize;
    double subtitleFontSize;
    double comingSoonFontSize;
    double progressWidth;
    double progressHeight;
    double spacing1;
    double spacing2;
    double spacing3;
    double spacing4;

    if (screenWidth < 500) {
      // Mobile
      containerWidth = screenWidth * 0.9;
      containerHeight = screenWidth * 0.7;
      padding = 20;
      iconSize = 25;
      iconContainerSize = 50;
      titleFontSize = 20;
      subtitleFontSize = 12;
      comingSoonFontSize = 16;
      progressWidth = 120;
      progressHeight = 4;
      spacing1 = 15;
      spacing2 = 8;
      spacing3 = 4;
      spacing4 = 15;
    } else if (screenWidth < 1000) {
      // Tablet
      containerWidth = screenWidth * 0.6;
      containerHeight = screenWidth * 0.5;
      padding = 25;
      iconSize = 30;
      iconContainerSize = 60;
      titleFontSize = 22;
      subtitleFontSize = 13;
      comingSoonFontSize = 17;
      progressWidth = 130;
      progressHeight = 5;
      spacing1 = 20;
      spacing2 = 10;
      spacing3 = 6;
      spacing4 = 18;
    } else {
      // Desktop
      containerWidth = 400;
      containerHeight = 350;
      padding = 30;
      iconSize = 35;
      iconContainerSize = 70;
      titleFontSize = 26;
      subtitleFontSize = 14;
      comingSoonFontSize = 18;
      progressWidth = 150;
      progressHeight = 6;
      spacing1 = 25;
      spacing2 = 10;
      spacing3 = 5;
      spacing4 = 20;
    }

    return Center(
      child: Container(
        width: isDesktop ? null : containerWidth,
        height: isDesktop ? null : containerHeight,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[50]!,
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withOpacity(0.3),
              blurRadius: 25,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: isDesktop ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            // Animated Icon
            Container(
              width: iconContainerSize,
              height: iconContainerSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.green,
                    AppColors.green.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.green.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.campaign_rounded,
                size: iconSize,
                color: Colors.white,
              ),
            ),
            SizedBox(height: spacing1),
            
            // Title with gradient text
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  AppColors.green,
                  AppColors.green.withOpacity(0.7),
                ],
              ).createShader(bounds),
              child: Text(
                'Announcements',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: spacing2),
            
            // Subtitle
            Text(
              'Feature is under development',
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: spacing3),
            
            // Coming Soon text
            Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: comingSoonFontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.green,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: spacing4),
            
            // Animated progress bar
            Container(
              height: progressHeight,
              width: progressWidth,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Animated progress
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                    width: progressWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.green,
                          AppColors.green.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}