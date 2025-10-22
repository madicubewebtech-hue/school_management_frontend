import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavbar(
                  currentIndex: 2,
                  onIndexChanged: (index) {},
                ),
              ),
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
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "Class 10 - Annual Syllabus",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                // Image (dummy syllabus image)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/syllabus.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: isWide ? 400 : 250,
               errorBuilder: (context, error, stackTrace) => Container(
                      height: 250,
                      alignment: Alignment.center,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Description card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📚 Subjects Covered:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("• Mathematics\n• English\n• Science (Physics, Chemistry, Biology)\n• History & Civics\n• Geography\n• Computer Science"),
                      SizedBox(height: 16),
                      Text(
                        "🗓️ Duration:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Term 1: April - September\nTerm 2: October - March"),
                      SizedBox(height: 16),
                      Text(
                        "📄 Note:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Detailed syllabus PDF will be available soon. Please contact your class teacher for more information.",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Download button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download_rounded, color: Colors.white),
                  label: const Text(
                    "Download Syllabus (Coming Soon)",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
