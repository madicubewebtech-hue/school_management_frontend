import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/assignments/create_assignment_screen.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/widgets/navigation.dart';
import 'assignment_widgets.dart';

class AssignmentListScreen extends StatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  State<AssignmentListScreen> createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavbar()),
                            );
          },
        ),
        title: const Text(
          'Assignment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Section
            _buildHeaderSection(),
            const SizedBox(height: 20),
            
            // Search Section
            _buildSearchSection(),
            const SizedBox(height: 20),
            
            // Assignment List
            Expanded(
              child: _buildAssignmentList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateAssignmentScreen(),
            ),
          );
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.assignment, color: AppColors.green, size: 24),
            const SizedBox(width: 12),
            const Text(
              'Assignment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAssignmentScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Create Assignment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search assignments...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentList() {
    final List<Map<String, dynamic>> assignments = [
      {
        'title': 'Homework Title',
        'subject': 'English',
        'date': '22/04/2022',
        'hasAttachment': true,
      },
      {
        'title': 'Homework Title',
        'subject': 'Accounts',
        'date': '25/04/2022',
        'hasAttachment': true,
      },
      {
        'title': 'Homework Title',
        'subject': 'Accounts',
        'date': '28/04/2022',
        'hasAttachment': false,
      },
    ];

    return ListView.builder(
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return AssignmentCard(
          title: assignment['title'],
          subject: assignment['subject'],
          date: assignment['date'],
          hasAttachment: assignment['hasAttachment'],
          onView: () {
            _showViewDialog(assignment);
          },
          onDelete: () {
            _showDeleteDialog(assignment);
          },
        );
      },
    );
  }

  void _showViewDialog(Map<String, dynamic> assignment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(assignment['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: ${assignment['subject']}'),
            Text('Due Date: ${assignment['date']}'),
            if (assignment['hasAttachment']) 
              const Text('Attachment: Available'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Map<String, dynamic> assignment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Assignment'),
        content: Text('Are you sure you want to delete "${assignment['title']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement delete functionality
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('"${assignment['title']}" deleted')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}