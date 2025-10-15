import 'package:flutter/material.dart';
import 'package:school_management_frontend/widgets/custom_card_widget.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isWeb = screenWidth > 800;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Some other header or background
          Container(
            height: isWeb ? screenHeight * 0.2 : screenHeight * 0.15,
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "Teacher Dashboard",
              style: TextStyle(
                color: Colors.white,
                fontSize: isWeb ? 28 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Reusing CustomCardContainer
          CustomCardContainer(
            topPosition: isWeb ? screenHeight * 0.1 : screenHeight * 0.08,
            leftContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Manage Classes",
                  style: TextStyle(
                    fontSize: isWeb ? 24 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Check Attendance",
                  style: TextStyle(
                    fontSize: isWeb ? 24 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            rightContent: Icon(
              Icons.class_,
              size: isWeb ? 100 : 70,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
