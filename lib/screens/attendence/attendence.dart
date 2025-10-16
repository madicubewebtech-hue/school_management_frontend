import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Attendance data for all students
  List<List<bool>> attendanceData =
      List.generate(50, (_) => List.generate(3, (_) => false));

  // Pagination
  int currentPage = 0;
  final int studentsPerPage = 10;

  // Date
  DateTime selectedDate = DateTime.now();
  String? selectedClass = 'Class 1';

  // Class options
  final List<String> classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5'
  ];

  int get totalPages => (attendanceData.length / studentsPerPage).ceil();

  List<int> get currentStudentIndices {
    final startIndex = currentPage * studentsPerPage;
    final endIndex = (currentPage + 1) * studentsPerPage;
    return List.generate(
      (endIndex > attendanceData.length
          ? attendanceData.length - startIndex
          : studentsPerPage),
      (index) => startIndex + index,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _submitAttendance() {
    int presentCount = 0;
    int lateCount = 0;
    int absentCount = 0;

    for (var student in attendanceData) {
      if (student[0]) presentCount++;
      if (student[1]) lateCount++;
      if (student[2]) absentCount++;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Attendance Submitted'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
            Text('Class: $selectedClass'),
            Text('Present: $presentCount'),
            Text('Late: $lateCount'),
            Text('Absent: $absentCount'),
            Text('Total: ${attendanceData.length}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _goToNextPage() {
    if (currentPage < totalPages - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  void _goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWeb = screenWidth > 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AutoSizeText(
          'Demo Public School',
          maxLines: 1,
          minFontSize: 14,
          maxFontSize: 22,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F2F1),
              Color(0xFFB2DFDB),
              Color(0xFF80CBC4),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(isWeb ? 24.0 : 16.0),
          child: Column(
            children: [
              // Header with Date and Class Selection
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isWeb ? 20 : 12),
                  child: Row(
                    children: [
                      // Date Picker
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Select Date',
                              maxLines: 1,
                              minFontSize: 12,
                              maxFontSize: isWeb ? 18 : 14,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.green),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: EdgeInsets.all(isWeb ? 14 : 12),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: const Color(0xFF008080)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today,
                                        size: isWeb ? 22 : 20,
                                        color: const Color(0xFF008080)),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: AutoSizeText(
                                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: isWeb ? 16 : 14,
                                        style: const TextStyle(
                                            color: AppColors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Class Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Select Class',
                              maxLines: 1,
                              minFontSize: 12,
                              maxFontSize: isWeb ? 18 : 14,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.green),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: isWeb ? 14 : 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.green),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedClass,
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: AppColors.green),
                                  isExpanded: true,
                                  items: classes.map((String classItem) {
                                    return DropdownMenuItem<String>(
                                      value: classItem,
                                      child: AutoSizeText(
                                        classItem,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: isWeb ? 16 : 14,
                                        style: const TextStyle(
                                            color: AppColors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedClass = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Table Header
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: isWeb ? 16.0 : 12.0,
                      horizontal: isWeb ? 12 : 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AutoSizeText(
                          'Student Name',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 12,
                          maxFontSize: isWeb ? 18 : 14,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: AutoSizeText(
                          'Attendance',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 12,
                          maxFontSize: isWeb ? 18 : 14,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Student List
              Expanded(
                child: ListView.builder(
                  itemCount: currentStudentIndices.length,
                  itemBuilder: (context, index) {
                    final studentIndex = currentStudentIndices[index];
                    return _buildStudentRow(studentIndex, index + 1, isWeb);
                  },
                ),
              ),
              SizedBox(height: 16,),
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: Padding(
    padding: EdgeInsets.all(isWeb ? 16.0 : 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Pagination Section - Wrap with Expanded
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _goToPreviousPage,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: const Color(0xFF008080),
                  size: isWeb ? 22 : 18,
                ),
                padding: EdgeInsets.zero, // Reduce padding
                constraints: const BoxConstraints(minWidth: 36), // Minimum tap area
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${currentPage + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF008080),
                  ),
                ),
              ),
              IconButton(
                onPressed: _goToNextPage,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF008080),
                  size: isWeb ? 22 : 18,
                ),
                padding: EdgeInsets.zero, // Reduce padding
                constraints: const BoxConstraints(minWidth: 36), // Minimum tap area
              ),
            ],
          ),
        ),

        // Submit Button - Wrap with Expanded and make text responsive
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ElevatedButton(
                onPressed: _submitAttendance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF008080),
                  padding: EdgeInsets.symmetric(
                    horizontal: isWeb ? 16 : 12,
                    vertical: isWeb ? 12 : 10,
                  ),
                  minimumSize: Size.zero, // Remove minimum size constraint
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12, // Smaller font for mobile
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentRow(int studentIndex, int displayNumber, bool isWeb) {
    return Container(
      margin: EdgeInsets.only(bottom: isWeb ? 12 : 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: isWeb ? 16.0 : 12.0, horizontal: isWeb ? 20 : 16.0),
        child: Row(
          children: [
            // Student Number and Name
            Expanded(
              flex: 2,
              child: AutoSizeText(
                '$displayNumber. Student ${studentIndex + 1}',
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: isWeb ? 16 : 14,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Attendance Checkboxes
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildAttendanceCheckbox(
                        studentIndex, 0, 'P', 'Present', isWeb),
                    _buildAttendanceCheckbox(
                        studentIndex, 1, 'L', 'Late', isWeb),
                    _buildAttendanceCheckbox(
                        studentIndex, 2, 'A', 'Absent', isWeb),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCheckbox(
      int studentIndex, int attendanceIndex, String label, String type, bool isWeb) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < 3; i++) {
            attendanceData[studentIndex][i] = (i == attendanceIndex);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(
            horizontal: isWeb ? 14 : 12, vertical: isWeb ? 8 : 6),
        decoration: BoxDecoration(
          color: attendanceData[studentIndex][attendanceIndex]
              ? _getCheckboxColor(type)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _getCheckboxColor(type),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              attendanceData[studentIndex][attendanceIndex]
                  ? Icons.check
                  : Icons.check_box_outline_blank,
              size: isWeb ? 18 : 16,
              color: attendanceData[studentIndex][attendanceIndex]
                  ? Colors.white
                  : _getCheckboxColor(type),
            ),
            SizedBox(width: isWeb ? 6 : 4),
            AutoSizeText(
              label,
              maxLines: 1,
              minFontSize: 10,
              maxFontSize: isWeb ? 16 : 12,
              style: TextStyle(
                color: attendanceData[studentIndex][attendanceIndex]
                    ? Colors.white
                    : _getCheckboxColor(type),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCheckboxColor(String type) {
    switch (type) {
      case 'Present':
        return AppColors.green;
      case 'Late':
        return const Color(0xFFFF9800); // Orange
      case 'Absent':
        return const Color(0xFFF44336); // Red
      default:
        return const Color(0xFF008080); // Teal
    }
  }
}
