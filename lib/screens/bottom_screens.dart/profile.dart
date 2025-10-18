import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Dummy profile data
  final Map<String, String> profileData = const {
    "Name": "John Doe",
    "Email": "john.doe@example.com",
    "Phone": "+91 9876543210",
    "Class": "10th Grade",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      
      body: Column(
        children: [
          // Profile Avatar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: AppColors.green,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "John Doe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "10th Grade",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          // Profile Info Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: profileData.entries.map((entry) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      entry.key == "Email"
                          ? Icons.email
                          : entry.key == "Phone"
                              ? Icons.phone
                              : Icons.info,
                      color: AppColors.green,
                    ),
                    title: Text(
                      entry.key,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      entry.value,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
