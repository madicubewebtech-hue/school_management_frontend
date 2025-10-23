import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
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
          'Syllabus',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      body: _buildSyllabusContent(),
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
          'Syllabus',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      body: _buildSyllabusContent(),
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
                          'Syllabus',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Syllabus Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildSyllabusContent(isDesktop: true),
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

  // Common Syllabus Content
  Widget _buildSyllabusContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    double titleFontSize;
    double contentFontSize;
    double imageHeight;
    double maxWidth;
    double padding;

    if (screenWidth < 500) {
      // Mobile
      titleFontSize = 18;
      contentFontSize = 14;
      imageHeight = 200;
      maxWidth = double.infinity;
      padding = 16;
    } else if (screenWidth < 1000) {
      // Tablet
      titleFontSize = 22;
      contentFontSize = 15;
      imageHeight = 300;
      maxWidth = 700;
      padding = 20;
    } else {
      // Desktop
      titleFontSize = 24;
      contentFontSize = 16;
      imageHeight = 350;
      maxWidth = 800;
      padding = 24;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                "Class 10 - Annual Syllabus",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenWidth < 500 ? 12 : 16),

              // Image (dummy syllabus image)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/syllabus.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: imageHeight,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: imageHeight,
                    alignment: Alignment.center,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.broken_image, 
                      size: screenWidth < 500 ? 40 : 60, 
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenWidth < 500 ? 16 : 20),

              // Description card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth < 500 ? 12 : 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "📚 Subjects Covered:",
                      style: TextStyle(
                        fontSize: contentFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenWidth < 500 ? 6 : 8),
                    Text(
                      "• Mathematics\n• English\n• Science (Physics, Chemistry, Biology)\n• History & Civics\n• Geography\n• Computer Science",
                      style: TextStyle(fontSize: contentFontSize),
                    ),
                    SizedBox(height: screenWidth < 500 ? 12 : 16),
                    Text(
                      "🗓️ Duration:",
                      style: TextStyle(
                        fontSize: contentFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenWidth < 500 ? 6 : 8),
                    Text(
                      "Term 1: April - September\nTerm 2: October - March",
                      style: TextStyle(fontSize: contentFontSize),
                    ),
                    SizedBox(height: screenWidth < 500 ? 12 : 16),
                    Text(
                      "📄 Note:",
                      style: TextStyle(
                        fontSize: contentFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenWidth < 500 ? 6 : 8),
                    Text(
                      "Detailed syllabus PDF will be available soon. Please contact your class teacher for more information.",
                      style: TextStyle(fontSize: contentFontSize),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth < 500 ? 20 : 30),

              // Download button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded, color: Colors.white),
                label: Text(
                  "Download Syllabus (Coming Soon)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth < 500 ? 14 : 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth < 500 ? 20 : 24, 
                    vertical: screenWidth < 500 ? 12 : 14
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}