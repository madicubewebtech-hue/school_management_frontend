// Custom Photo Section Widget
import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/admissions/adm_widgets/text_widgets.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class AdmissionPhotoSection extends StatelessWidget {
  const AdmissionPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AdmissionLabel(text: 'Photo *'),
        const SizedBox(height: 8),
        Container(
          width: 120,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                AppColors.lightGreen.withOpacity(0.3),
              ],
            ),
            border: Border.all(color: AppColors.green.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined, color: AppColors.green, size: 32),
              const SizedBox(height: 8),
              Text(
                'Add Photo',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// Custom Progress Indicator Widget
class AdmissionProgressIndicator extends StatelessWidget {
  final int currentPage;
  
  const AdmissionProgressIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressStep(1, 'Student', currentPage >= 0),
              _buildProgressStep(2, 'Parent', currentPage >= 1),
              _buildProgressStep(3, 'Payment', currentPage >= 2),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: (currentPage + 1) / 3,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
            borderRadius: BorderRadius.circular(10),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isActive ? AppColors.green : Colors.grey[300],
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.green : Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.green : Colors.grey[600],
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}