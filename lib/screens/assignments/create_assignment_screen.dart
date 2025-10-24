import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class CreateAssignmentScreen extends StatefulWidget {
  const CreateAssignmentScreen({super.key});

  @override
  State<CreateAssignmentScreen> createState() => _CreateAssignmentScreenState();
}

class _CreateAssignmentScreenState extends State<CreateAssignmentScreen> {
  final TextEditingController _classSectionController = TextEditingController();
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _shareAssignment = true;

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
      backgroundColor: Colors.grey[50],
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
          'Create Assignment',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAssignmentContent(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
          'Create Assignment',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildAssignmentContent(),
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
                          'Create Assignment',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Assignment Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildAssignmentContent(isDesktop: true),
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
  Widget _buildAssignmentContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenPadding = isDesktop 
        ? const EdgeInsets.symmetric(horizontal: 80, vertical: 20) 
        : screenWidth < 500 
            ? const EdgeInsets.all(16)
            : const EdgeInsets.all(24);

    return SingleChildScrollView(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(isDesktop),
          SizedBox(height: isDesktop ? 32 : 24),
          _buildFormFields(isDesktop),
          SizedBox(height: isDesktop ? 32 : 24),
          _buildSubmitButton(isDesktop),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(bool isDesktop) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 20 : 16),
        child: Row(
          children: [
            Icon(Icons.assignment_add, color: AppColors.green, size: isDesktop ? 28 : 24),
            SizedBox(width: isDesktop ? 16 : 12),
            Text(
              'Create Assignment', 
              style: TextStyle(
                fontSize: isDesktop ? 20 : 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.black87
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields(bool isDesktop) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _formField('Class Section', controller: _classSectionController, isRequired: true, hintText: 'Select class section', isDesktop: isDesktop),
            _formField('Topic Name', controller: _topicNameController, isRequired: true, hintText: 'Enter topic name', isDesktop: isDesktop),
            _formField('Assignment Description', controller: _descriptionController, isRequired: true, hintText: 'Enter assignment description', maxLines: 4, isDesktop: isDesktop),
            isDesktop 
                ? Row(
                    children: [
                      Expanded(child: _formField('Due Date', controller: _dueDateController, isRequired: true, hintText: 'Select due date', readOnly: true, onTap: _selectDate, isDesktop: isDesktop)),
                      const SizedBox(width: 16),
                      Expanded(child: _formField('Time', controller: _timeController, isRequired: true, hintText: 'Select time', readOnly: true, onTap: _selectTime, isDesktop: isDesktop)),
                    ],
                  )
                : Column(
                    children: [
                      _formField('Due Date', controller: _dueDateController, isRequired: true, hintText: 'Select due date', readOnly: true, onTap: _selectDate, isDesktop: isDesktop),
                      const SizedBox(height: 16),
                      _formField('Time', controller: _timeController, isRequired: true, hintText: 'Select time', readOnly: true, onTap: _selectTime, isDesktop: isDesktop),
                    ],
                  ),
            _attachmentBox(isDesktop),
            _checkboxField('Share Assignment', _shareAssignment, (val) => setState(() => _shareAssignment = val ?? false), isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _formField(String label, {
    required TextEditingController controller, 
    bool isRequired = false, 
    String? hintText, 
    int maxLines = 1, 
    bool readOnly = false, 
    VoidCallback? onTap,
    required bool isDesktop
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 12 : 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label, 
                style: TextStyle(
                  fontSize: isDesktop ? 16 : 14, 
                  fontWeight: FontWeight.w500, 
                  color: Colors.black87
                ),
              ),
              if (isRequired) const Text('*', style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
          SizedBox(height: isDesktop ? 12 : 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 16 : 12, 
                vertical: isDesktop ? 16 : 12
              ),
              suffixIcon: readOnly && onTap != null 
                  ? IconButton(
                      icon: Icon(
                        label == 'Time' ? Icons.access_time : Icons.calendar_today, 
                        size: isDesktop ? 22 : 20
                      ), 
                      onPressed: onTap,
                    ) 
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _attachmentBox(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 12 : 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: isDesktop ? 100 : 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.05),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_file, 
                  color: Colors.grey, 
                  size: isDesktop ? 28 : 24
                ),
                SizedBox(height: isDesktop ? 8 : 4),
                Text(
                  'Add Attachment', 
                  style: TextStyle(
                    color: Colors.grey, 
                    fontSize: isDesktop ? 14 : 12
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _checkboxField(String label, bool value, ValueChanged<bool?> onChanged, bool isDesktop) {
    return Row(
      children: [
        Checkbox(
          value: value, 
          onChanged: onChanged, 
          activeColor: AppColors.green,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        SizedBox(width: isDesktop ? 12 : 8),
        Text(
          label, 
          style: TextStyle(
            fontSize: isDesktop ? 16 : 14, 
            color: Colors.black87
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(bool isDesktop) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _createAssignment,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: isDesktop ? 18 : 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Create Assignment', 
          style: TextStyle(
            fontSize: isDesktop ? 18 : 16, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100)
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dueDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  void _createAssignment() {
    if (_classSectionController.text.isEmpty ||
        _topicNameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _dueDateController.text.isEmpty ||
        _timeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields'))
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assignment created successfully'))
    );
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
  }

  @override
  void dispose() {
    _classSectionController.dispose();
    _topicNameController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}