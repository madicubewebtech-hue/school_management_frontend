import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/assignments/create_assignment_screen.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'assignment_widgets.dart';
import 'package:school_management_frontend/new/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

// ----------------- Assignment List Screen -----------------
class AssignmentListScreen extends StatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  State<AssignmentListScreen> createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> assignments = [
    {'title': 'Homework Title 1', 'subject': 'English', 'date': '22/04/2022', 'hasAttachment': true},
    {'title': 'Homework Title 2', 'subject': 'Accounts', 'date': '25/04/2022', 'hasAttachment': true},
    {'title': 'Homework Title 3', 'subject': 'Maths', 'date': '28/04/2022', 'hasAttachment': false},
    {'title': 'Homework Title 4', 'subject': 'Science', 'date': '30/04/2022', 'hasAttachment': true},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive logic
    if (screenWidth < 500) {
      return _buildMobileLayout();
    } else if (screenWidth < 1000) {
      return _buildTabletLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  // Mobile Layout
  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavbar()));
          },
        ),
        title: const Text('Assignments',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAssignmentContent(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavbar()));
          },
        ),
        title: const Text('Assignments',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAssignmentContent(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // Desktop Layout - FIXED
  Widget _buildDesktopLayout() {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Left Sidebar
            Expanded(
              flex: 1,
              child: SidebarNavigation(),
            ),

            // Main Content - FIXED: SingleChildScrollView को Column के बाहर ले जाएं
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Desktop Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                       
                        const Text(
                          'Assignments',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                        const Spacer(),
                        _buildFloatingActionButton(),
                      ],
                    ),
                  ),
                  
                  // Assignment Grid - FIXED: Expanded के अंदर
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildAssignmentGrid(isDesktop: true),
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

  // Common Assignment Content
  Widget _buildAssignmentContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Assignment Grid - FIXED: Expanded के अंदर
          Expanded(
            child: _buildAssignmentGrid(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Assignment Grid Builder - FIXED
  Widget _buildAssignmentGrid({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth < 600) {
      // Mobile
      crossAxisCount = 1;
      childAspectRatio = 1.3; // Reduced from 1.7
    } else if (screenWidth < 1200) {
      // Tablet
      crossAxisCount = 2;
      childAspectRatio = 1.2; // Reduced from 1.7
    } else {
      // Desktop
      crossAxisCount = 3;
      childAspectRatio = 1.0; // Reduced from 1.5
    }

    return GridView.builder(
      shrinkWrap: true, // ADD THIS
      physics: const AlwaysScrollableScrollPhysics(), // CHANGED THIS
      itemCount: assignments.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return AssignmentCard(
          title: assignment['title'],
          subject: assignment['subject'],
          date: assignment['date'],
          hasAttachment: assignment['hasAttachment'],
          onView: () => _showViewDialog(assignment),
          onDelete: () => _showDeleteDialog(assignment),
        );
      },
    );
  }

  // Floating Action Button
  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateAssignmentScreen()));
      },
      backgroundColor: AppColors.green,
      child: const Icon(Icons.add, color: Colors.white),
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
            if (assignment['hasAttachment']) const Text('Attachment: Available'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
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