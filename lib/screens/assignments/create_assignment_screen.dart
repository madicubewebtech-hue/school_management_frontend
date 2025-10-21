import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';


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
    final isWeb = MediaQuery.of(context).size.width > 600;
    final screenPadding = isWeb ? EdgeInsets.symmetric(horizontal: 80, vertical: 20) : const EdgeInsets.all(16);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 24),
            _buildFormFields(isWeb),
            const SizedBox(height: 24),
            _buildSubmitButton(isWeb),
          ],
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
          children: const [
            Icon(Icons.assignment_add, color: Colors.green, size: 24),
            SizedBox(width: 12),
            Text('Create Assignment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields(bool isWeb) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _formField('Class Section', controller: _classSectionController, isRequired: true, hintText: 'Select class section'),
            _formField('Topic Name', controller: _topicNameController, isRequired: true, hintText: 'Enter topic name'),
            _formField('Assignment Description', controller: _descriptionController, isRequired: true, hintText: 'Enter assignment description', maxLines: 4),
            Row(
              children: [
                Expanded(child: _formField('Due Date', controller: _dueDateController, isRequired: true, hintText: 'Select due date', readOnly: true, onTap: _selectDate)),
                const SizedBox(width: 16),
                Expanded(child: _formField('Time', controller: _timeController, isRequired: true, hintText: 'Select time', readOnly: true, onTap: _selectTime)),
              ],
            ),
            _attachmentBox(),
            _checkboxField('Share Assignment', _shareAssignment, (val) => setState(() => _shareAssignment = val ?? false)),
          ],
        ),
      ),
    );
  }

  Widget _formField(String label,
      {required TextEditingController controller, bool isRequired = false, String? hintText, int maxLines = 1, bool readOnly = false, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
              if (isRequired) const Text('*', style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              suffixIcon: readOnly && onTap != null ? IconButton(icon: Icon(label == 'Time' ? Icons.access_time : Icons.calendar_today), onPressed: onTap) : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _attachmentBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.05),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.attach_file, color: Colors.grey, size: 24), SizedBox(height: 4), Text('Add Attachment', style: TextStyle(color: Colors.grey, fontSize: 12))],
            ),
          ),
        ),
      ),
    );
  }

  Widget _checkboxField(String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged, activeColor: Colors.green),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _buildSubmitButton(bool isWeb) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _createAssignment,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('Create Assignment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dueDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all required fields')));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Assignment created successfully')));
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
