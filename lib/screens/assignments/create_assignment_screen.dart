import 'package:flutter/material.dart';
import 'assignment_widgets.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Create Assignment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeaderSection(),
              const SizedBox(height: 24),
              
              // Form
              _buildAssignmentForm(),
              const SizedBox(height: 24),
              
              // Submit Button
              _buildSubmitButton(),
            ],
          ),
        ),
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
            const Icon(Icons.assignment_add, color: Colors.green, size: 24),
            const SizedBox(width: 12),
            const Text(
              'Create Assignment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentForm() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Class Section
            AssignmentFormField(
              label: 'Class Section',
              isRequired: true,
              child: TextField(
                controller: _classSectionController,
                decoration: const InputDecoration(
                  hintText: 'Select class section',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            
            // Topic Name
            AssignmentFormField(
              label: 'Topic Name',
              isRequired: true,
              child: TextField(
                controller: _topicNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter topic name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            
            // Assignment Description
            AssignmentFormField(
              label: 'Assignment Description',
              isRequired: true,
              child: TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter assignment description',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            
            // Due Date and Time Row
            Row(
              children: [
                // Due Date
                Expanded(
                  child: AssignmentFormField(
                    label: 'Due Date',
                    isRequired: true,
                    child: TextField(
                      controller: _dueDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select due date',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: _selectDate,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Time
                Expanded(
                  child: AssignmentFormField(
                    label: 'Time',
                    isRequired: true,
                    child: TextField(
                      controller: _timeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select time',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: _selectTime,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Attachment
            AssignmentFormField(
              label: 'Attachment',
              child:  AttachmentBox(
                onTap: () {
                  // Handle attachment selection
                },
              ),
            ),
            
            // Share Assignment Checkbox
            AssignmentCheckboxField(
              label: 'Share Assignment',
              value: _shareAssignment,
              onChanged: (value) {
                setState(() {
                  _shareAssignment = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _createAssignment,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Create Assignment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dueDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    // Handle assignment creation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assignment created successfully')),
    );
    
    // Navigate back after success
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
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