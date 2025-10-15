// Custom Payment Option Widget
import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class AdmissionPaymentOption extends StatelessWidget {
  final String label;
  final String value;
  final String selectedValue;
  final Function(String) onChanged;

  const AdmissionPaymentOption({
    super.key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: selectedValue == value 
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.green,
                  AppColors.green.withOpacity(0.8),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  AppColors.lightGreen.withOpacity(0.1),
                ],
              ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selectedValue == value ? AppColors.green : AppColors.green.withOpacity(0.3),
          width: selectedValue == value ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onChanged(value),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  selectedValue == value ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: selectedValue == value ? Colors.white : AppColors.green,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selectedValue == value ? Colors.white : AppColors.green,
                    fontSize: 14,
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

// Custom Payment Section Widget
class AdmissionPaymentSection extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;

  const AdmissionPaymentSection({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.green.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        children: [
          AdmissionPaymentOption(
            label: 'Cash',
            value: 'Cash',
            selectedValue: selectedValue,
            onChanged: onChanged,
          ),
          AdmissionPaymentOption(
            label: 'Quick',
            value: 'Quick',
            selectedValue: selectedValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
