import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/custom_card_widget.dart';
import 'package:school_management_frontend/widgets/custom_horizontal_row.dart';

import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

import 'package:auto_size_text/auto_size_text.dart';


class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isWeb = screenWidth > 800;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        drawer: SidebarNavigation(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: isWeb ? screenHeight * 0.22 : screenHeight * 0.18,
                    width: double.infinity,
                    color: AppColors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: isWeb ? 24 : 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu, color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        Image.asset(
                          'assets/school_logo.png',
                          height: isWeb ? 60 : 45,
                          width: isWeb ? 60 : 45,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.school,
                              size: isWeb ? 60 : 45,
                              color: Colors.white,
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AutoSizeText(
                            "Demo Public School",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isWeb ? 26 : 20,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCardContainer(
                    topPosition: isWeb ? screenHeight * 0.12 : screenHeight * 0.10,
                    leftContent: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Learn Today",
                          style: TextStyle(
                            fontSize: isWeb ? 24 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          minFontSize: 12,
                        ),
                        const SizedBox(height: 8),
                        AutoSizeText(
                          "and",
                          style: TextStyle(
                            fontSize: isWeb ? 24 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          minFontSize: 12,
                        ),
                        const SizedBox(height: 8),
                        AutoSizeText(
                          "have a bright future.",
                          style: TextStyle(
                            fontSize: isWeb ? 24 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          minFontSize: 12,
                        ),
                      ],
                    ),
                    rightContent: Image.asset(
                      'assets/book_image.png',
                      width: isWeb ? 100 : 95,
                      height: isWeb ? 100 : 95,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.business,
                          size: isWeb ? 100 : 70,
                          color: Colors.cyan,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: isWeb ? screenHeight * 0.12 : screenHeight * 0.15),
              CustomHorizontalRow(
                title: "Class Incharge",
                isWeb: isWeb,
                items: [
                  {
                    'name': 'Mr. Sharma',
                    'subject': 'Mathematics',
                    'image': 'assets/teacher3.jpg',
                  },
                ],
              ),
              const SizedBox(height: 20),
              CustomHorizontalRow(
                title: "Subject Teachers",
                isWeb: isWeb,
                items: [
                  {
                    'name': 'Ms. Kanika',
                    'subject': 'English',
                    'image': 'assets/teacher1.jpg',
                  },
                  {
                    'name': 'Mrs. Anjali ',
                    'subject': 'Science',
                    'image': 'assets/teacher2.jpg',
                  },
                  {
                    'name': 'Mr. Sahil',
                    'subject': 'SST',
                    'image': 'assets/teacher4.jpg',
                  },
                  {
                    'name': 'Mrs. Hemlata',
                    'subject': 'Hindi',
                    'image': 'assets/teacher1.jpg',
                  },
                  {
                    'name': 'Ms. Kapoor',
                    'subject': 'Science',
                    'image': 'assets/teacher2.jpg',
                  },
                  {
                    'name': 'Mr. Singh',
                    'subject': 'Punjabi',
                    'image': 'assets/teacher4.jpg',
                  },
                  {
                    'name': 'Ms. Mehak',
                    'subject': 'English',
                    'image': 'assets/teacher1.jpg',
                  },
                  {
                    'name': 'Ms. Kapoor',
                    'subject': 'Science',
                    'image': 'assets/teacher2.jpg',
                  },
                  {
                    'name': 'Mr. Singh',
                    'subject': 'Punjabi',
                    'image': 'assets/teacher4.jpg',
                  },
                ],
              ),
              const SizedBox(height: 20),
              CustomTextRow(
                isWeb: isWeb,
                title: 'Notices',
                items: [
                  {
                    'text': 'Dear staff members,Meeting has been scheduled on II saturday',
                  },
                  {
                    'text': 'PTM will be on this saturday. Please maintain all the exams reports.',
                  },
                  {
                    'text': 'Our school will celebrate annual day on 15th August. All are invited.',
                  },
                  {
                    'text': 'School buses timing has been changed. Please check the new timings on the website.',
                  },
                  {
                    'text': 'Dear staff members,Meeting has been scheduled on II saturday',
                  },
                  {
                    'text': 'Dear staff members,Meeting has been scheduled on II saturday',
                  },
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
