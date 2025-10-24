import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class KnowYourTeachersScreen extends StatefulWidget {
  const KnowYourTeachersScreen({super.key});

  @override
  State<KnowYourTeachersScreen> createState() => _KnowYourTeachersScreenState();
}

class _KnowYourTeachersScreenState extends State<KnowYourTeachersScreen> {
  // Dummy data for teachers
  final List<Map<String, String>> teachers = const [
    {
      'name': 'Mr. Rahul Sharma',
      'subject': 'Mathematics',
      'image': 'assets/teacher1.jpg',
    },
    {
      'name': 'Ms. Priya Kapoor',
      'subject': 'Science',
      'image': 'assets/teacher2.jpg',
    },
    {
      'name': 'Mr. Amit Verma',
      'subject': 'English',
      'image': 'assets/teacher3.jpg',
    },
    {
      'name': 'Mrs. Neha Gupta',
      'subject': 'Computer Science',
      'image': 'assets/teacher4.jpg',
    },
    {
      'name': 'Mr. Rajesh Singh',
      'subject': 'History',
      'image': 'assets/teacher1.jpg',
    },
    {
      'name': 'Ms. Anjali Mehta',
      'subject': 'Geography',
      'image': 'assets/teacher2.jpg',
    },
    {
      'name': 'Mr. Amit Verma',
      'subject': 'English',
      'image': 'assets/teacher3.jpg',
    },
    {
      'name': 'Mrs. Neha Gupta',
      'subject': 'Computer Science',
      'image': 'assets/teacher4.jpg',
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
        backgroundColor: AppColors.green,
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
          "Know Your Teachers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildTeachersContent(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.green,
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
          "Know Your Teachers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildTeachersContent(),
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
                          'Know Your Teachers',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Teachers Grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildTeachersGrid(isDesktop: true),
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

  // Common Teachers Content
  Widget _buildTeachersContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: _buildTeachersGrid(),
    );
  }

  // Teachers Grid Builder
  Widget _buildTeachersGrid({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    int crossAxisCount;
    double childAspectRatio;
    double avatarRadius;
    double nameFontSize;
    double subjectFontSize;
    double padding;

    if (screenWidth < 500) {
      // Mobile
      crossAxisCount = 2;
      childAspectRatio = 0.95;
      avatarRadius = 32;
      nameFontSize = 14;
      subjectFontSize = 11;
      padding = 10;
    } else if (screenWidth < 1000) {
      // Tablet
      crossAxisCount = 3;
      childAspectRatio = 1.0;
      avatarRadius = 36;
      nameFontSize = 15;
      subjectFontSize = 12;
      padding = 12;
    } else {
      // Desktop
      crossAxisCount = 4;
      childAspectRatio = 1.1;
      avatarRadius = 38;
      nameFontSize = 16;
      subjectFontSize = 13;
      padding = 14;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: teachers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final teacher = teachers[index];
        return _buildTeacherCard(
          teacher: teacher,
          avatarRadius: avatarRadius,
          nameFontSize: nameFontSize,
          subjectFontSize: subjectFontSize,
          padding: padding,
        );
      },
    );
  }

  // Teacher Card Widget
  Widget _buildTeacherCard({
    required Map<String, String> teacher,
    required double avatarRadius,
    required double nameFontSize,
    required double subjectFontSize,
    required double padding,
  }) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1CB5E0),
            Color(0xFF0A3D62),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A3D62).withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: teacher['image'] != null &&
                    teacher['image']!.isNotEmpty
                ? AssetImage(teacher['image']!)
                : const AssetImage('assets/default_teacher.jpg') as ImageProvider,
            backgroundColor: Colors.white24,
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            teacher['name'] ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: nameFontSize,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 8,
          ),
          const SizedBox(height: 4),
          AutoSizeText(
            teacher['subject'] ?? '',
            style: TextStyle(
              color: Colors.white70,
              fontSize: subjectFontSize,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 8,
          ),
        ],
      ),
    );
  }
}