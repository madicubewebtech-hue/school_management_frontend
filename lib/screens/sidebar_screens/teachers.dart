import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';

class KnowYourTeachersScreen extends StatelessWidget {
  const KnowYourTeachersScreen({super.key});

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
    final bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: AppColors.green,
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
          "Know Your Teachers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _TeachersGrid(teachers: teachers, isWeb: isWeb),
      ),
    );
  }
}

// ---------------- Grid Widget ----------------
class _TeachersGrid extends StatelessWidget {
  final List<Map<String, String>> teachers;
  final bool isWeb;

  static const List<Color> gradientColors = [
    Color(0xFF1CB5E0),
    Color(0xFF0A3D62),
  ];

  const _TeachersGrid({
    required this.teachers,
    required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = isWeb ? 38 : 32;
    final double nameFontSize = isWeb ? 16 : 14;
    final double subjectFontSize = isWeb ? 13 : 11;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: teachers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWeb ? 3 : 2, // 2 for mobile, 3 for web/tablet
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isWeb ? 1 : 0.95,
      ),
      itemBuilder: (context, index) {
        final teacher = teachers[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors[1].withOpacity(0.4),
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
                    : const AssetImage('assets/default_teacher.jpg'),
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
      },
    );
  }
}
