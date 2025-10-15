import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Attendance data for all students
  List<List<bool>> attendanceData = List.generate(50, (_) => List.generate(3, (_) => false));
  
  // Pagination
  int currentPage = 0;
  final int studentsPerPage = 10;
  
  // Date
  DateTime selectedDate = DateTime.now();
  String? selectedClass = 'Class 1';
  
  // Class options
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5'];

  int get totalPages => (attendanceData.length / studentsPerPage).ceil();

  List<int> get currentStudentIndices {
    final startIndex = currentPage * studentsPerPage;
    final endIndex = (currentPage + 1) * studentsPerPage;
    return List.generate(
      (endIndex > attendanceData.length ? attendanceData.length - startIndex : studentsPerPage),
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
    // Count attendance
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
            Text('Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Demo Public School',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.green,
        elevation: 0,
      ),
      body: Container(
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
          padding: const EdgeInsets.all(16.0),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Date Picker
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF008080)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 20, color: Color(0xFF008080)),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                      style: const TextStyle(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.bold,
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
                            const Text(
                              'Select Class',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.green,),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedClass,
                                  icon: const Icon(Icons.arrow_drop_down, color: AppColors.green,),
                                  isExpanded: true,
                                  items: classes.map((String classItem) {
                                    return DropdownMenuItem<String>(
                                      value: classItem,
                                      child: Text(
                                        classItem,
                                        style: const TextStyle(
                                          color: AppColors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
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

              // Class Header Row
              // Container(
              //   decoration: BoxDecoration(
              //     color: const Color(0xFF008080),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 12.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: classes.map((className) => _buildClassHeader(className)).toList(),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),

              // Table Header
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Student Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Attendance',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
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
                    return _buildStudentRow(studentIndex, index + 1);
                  },
                ),
              ),

              // Pagination and Submit Button
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
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Pagination
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _goToPreviousPage,
                              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF008080)),
                            ),
                            Text(
                              'Page ${currentPage + 1} of $totalPages',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF008080),
                              ),
                            ),
                            IconButton(
                              onPressed: _goToNextPage,
                              icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFF008080)),
                            ),
                          ],
                        ),
                      ),
                      
                      // Submit Button
                      ElevatedButton(
                        onPressed: _submitAttendance,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008080),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text(
                          'Submit Attendance',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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

  // Widget _buildClassHeader(String className) {
  //   return Text(
  //     className,
  //     style: const TextStyle(
  //       color: Colors.white,
  //       fontWeight: FontWeight.bold,
  //       fontSize: 14,
  //     ),
  //   );
  // }

  Widget _buildStudentRow(int studentIndex, int displayNumber) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            // Student Number and Name
            Expanded(
              flex: 2,
              child: Text(
                '$displayNumber. Student ${studentIndex + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),

            // Attendance Checkboxes
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAttendanceCheckbox(studentIndex, 0, 'P', 'Present'),
                  _buildAttendanceCheckbox(studentIndex, 1, 'L', 'Late'),
                  _buildAttendanceCheckbox(studentIndex, 2, 'A', 'Absent'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCheckbox(int studentIndex, int attendanceIndex, String label, String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Uncheck all other options for this student
          for (int i = 0; i < 3; i++) {
            attendanceData[studentIndex][i] = (i == attendanceIndex);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: attendanceData[studentIndex][attendanceIndex] ? _getCheckboxColor(type) : Colors.transparent,
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
              attendanceData[studentIndex][attendanceIndex] ? Icons.check : Icons.check_box_outline_blank,
              size: 16,
              color: attendanceData[studentIndex][attendanceIndex] ? Colors.white : _getCheckboxColor(type),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: attendanceData[studentIndex][attendanceIndex] ? Colors.white : _getCheckboxColor(type),
                fontWeight: FontWeight.bold,
                fontSize: 12,
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