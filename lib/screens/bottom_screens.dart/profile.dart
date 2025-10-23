import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Dummy profile data
  final Map<String, String> profileData = const {
    "Name": "John Doe",
    "Email": "john.doe@example.com",
    "Phone": "+91 9876543210",
    "Class": "10th Grade",
    "Roll No": "25",
    "Address": "123 Main Street, City, State",
    "Parent Name": "Robert Doe",
    "Parent Phone": "+91 9876543211",
  };

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
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
      ),
      body: _buildProfileContent(),
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
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
      ),
      body: _buildProfileContent(),
    );
  }

  // Desktop Layout - COMPACT VERSION
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

            // Main Content - COMPACT
            Expanded(
              flex: 3,
              child: Container(
                width: 600, // Fixed width for compact design
                margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: _buildProfileContent(isDesktop: true, isCompact: true),
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

  // Common Profile Content
  Widget _buildProfileContent({bool isDesktop = false, bool isCompact = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    double avatarRadius;
    double nameFontSize;
    double classFontSize;
    double padding;
    double titleFontSize;
    double subtitleFontSize;
    double iconSize;

    if (isCompact) {
      // Compact Desktop Version
      avatarRadius = 40;
      nameFontSize = 18;
      classFontSize = 14;
      padding = 16;
      titleFontSize = 14;
      subtitleFontSize = 12;
      iconSize = 20;
    } else if (screenWidth < 500) {
      // Mobile
      avatarRadius = 50;
      nameFontSize = 20;
      classFontSize = 16;
      padding = 16;
      titleFontSize = 16;
      subtitleFontSize = 14;
      iconSize = 24;
    } else if (screenWidth < 1000) {
      // Tablet
      avatarRadius = 60;
      nameFontSize = 22;
      classFontSize = 17;
      padding = 20;
      titleFontSize = 17;
      subtitleFontSize = 15;
      iconSize = 26;
    } else {
      // Regular Desktop
      avatarRadius = 70;
      nameFontSize = 24;
      classFontSize = 18;
      padding = 24;
      titleFontSize = 18;
      subtitleFontSize = 16;
      iconSize = 28;
    }

    return Column(
      children: [
        // Profile Avatar Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: isCompact ? 20 : (isDesktop ? 32 : 24)),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: isCompact 
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                : BorderRadius.zero,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: avatarRadius * 1.2,
                  color: AppColors.green,
                ),
              ),
              SizedBox(height: isCompact ? 8 : (isDesktop ? 16 : 12)),
              Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: nameFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isCompact ? 4 : (isDesktop ? 8 : 4)),
              Text(
                "10th Grade - Roll No: 25",
                style: TextStyle(
                  color: Colors.white70, 
                  fontSize: classFontSize,
                ),
              ),
            ],
          ),
        ),
        
        // Profile Info Cards
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(padding),
            children: profileData.entries.map((entry) {
              return Container(
                margin: EdgeInsets.only(bottom: isCompact ? 8 : (isDesktop ? 16 : 12)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(isCompact ? 8 : 12),
                  boxShadow: isCompact 
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                ),
                child: ListTile(
                  leading: Icon(
                    _getIconForField(entry.key),
                    color: AppColors.green,
                    size: iconSize,
                  ),
                  title: Text(
                    entry.key,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: titleFontSize,
                    ),
                  ),
                  subtitle: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: subtitleFontSize, 
                      color: Colors.black87,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: isCompact ? 12 : (isDesktop ? 20 : 16),
                    vertical: isCompact ? 8 : (isDesktop ? 12 : 8),
                  ),
                  dense: isCompact, // Make it more compact
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  IconData _getIconForField(String field) {
    switch (field) {
      case "Email":
        return Icons.email;
      case "Phone":
        return Icons.phone;
      case "Class":
        return Icons.school;
      case "Roll No":
        return Icons.confirmation_number;
      case "Address":
        return Icons.location_on;
      case "Parent Name":
        return Icons.family_restroom;
      case "Parent Phone":
        return Icons.phone_android;
      default:
        return Icons.person;
    }
  }
}