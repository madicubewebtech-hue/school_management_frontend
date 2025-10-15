import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class MonthlyAttendanceReportScreen extends StatefulWidget {
  const MonthlyAttendanceReportScreen({super.key});

  @override
  State<MonthlyAttendanceReportScreen> createState() => _MonthlyAttendanceReportScreenState();
}

class _MonthlyAttendanceReportScreenState extends State<MonthlyAttendanceReportScreen> {
  DateTime selectedMonth = DateTime.now();
  String? selectedClass = 'Class 1';
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5'];
  
  // Sample monthly attendance data
  final List<Map<String, dynamic>> monthlyAttendanceData = [
    {
      'name': 'Rahul Sharma',
      'totalDays': 22,
      'present': 20,
      'absent': 2,
      'late': 0,
      'percentage': 90.9,
    },
    {
      'name': 'Priya Singh',
      'totalDays': 22,
      'present': 22,
      'absent': 0,
      'late': 0,
      'percentage': 100.0,
    },
    {
      'name': 'Amit Kumar',
      'totalDays': 22,
      'present': 18,
      'absent': 3,
      'late': 1,
      'percentage': 81.8,
    },
    {
      'name': 'Sneha Patel',
      'totalDays': 22,
      'present': 21,
      'absent': 1,
      'late': 0,
      'percentage': 95.5,
    },
    {
      'name': 'Rohit Verma',
      'totalDays': 22,
      'present': 19,
      'absent': 2,
      'late': 1,
      'percentage': 86.4,
    },
    {
      'name': 'Neha Gupta',
      'totalDays': 22,
      'present': 22,
      'absent': 0,
      'late': 0,
      'percentage': 100.0,
    },
    {
      'name': 'Karan Malhotra',
      'totalDays': 22,
      'present': 20,
      'absent': 1,
      'late': 1,
      'percentage': 90.9,
    },
    {
      'name': 'Pooja Joshi',
      'totalDays': 22,
      'present': 17,
      'absent': 4,
      'late': 1,
      'percentage': 77.3,
    },
    {
      'name': 'Vikram Singh',
      'totalDays': 22,
      'present': 21,
      'absent': 1,
      'late': 0,
      'percentage': 95.5,
    },
    {
      'name': 'Anjali Reddy',
      'totalDays': 22,
      'present': 16,
      'absent': 5,
      'late': 1,
      'percentage': 72.7,
    },
  ];

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
      });
    }
  }

  void _printReport() {
    // Print functionality would go here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Monthly report printed successfully'),
        backgroundColor: AppColors.green,
      ),
    );
  }

  Color _getPercentageColor(double percentage) {
    if (percentage >= 90) return AppColors.green;
    if (percentage >= 75) return Colors.orange;
    return Colors.red;
  }

  Widget _buildPercentageIndicator(double percentage) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getPercentageColor(percentage),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${percentage.toStringAsFixed(1)}%',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  // Calculate overall statistics
  Map<String, dynamic> get overallStats {
    int totalStudents = monthlyAttendanceData.length;
    double avgPercentage = monthlyAttendanceData
        .map((student) => student['percentage'] as double)
        .reduce((a, b) => a + b) / totalStudents;
    
    int fullAttendance = monthlyAttendanceData
        .where((student) => student['percentage'] == 100.0)
        .length;
    
    int below75 = monthlyAttendanceData
        .where((student) => student['percentage'] < 75.0)
        .length;

    return {
      'avgPercentage': avgPercentage,
      'fullAttendance': fullAttendance,
      'below75': below75,
      'totalStudents': totalStudents,
    };
  }

  @override
  Widget build(BuildContext context) {
    final stats = overallStats;
    
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
        centerTitle: true,
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
              // Header Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // School Name and Logo
                      
                   

                      // Month and Class Selection
                      Row(
                        children: [
                          // Month Picker
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Select Month',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () => _selectMonth(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.green),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.calendar_today, 
                                            size: 20, color: AppColors.green),
                                        const SizedBox(width: 8),
                                        Text(
                                          '${_getMonthName(selectedMonth.month)} ${selectedMonth.year}',
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
                                    border: Border.all(color: AppColors.green),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedClass,
                                      icon: const Icon(Icons.arrow_drop_down, color: AppColors.green),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // // Overall Statistics Cards
              // Row(
              //   children: [
              //     Expanded(
              //       child: _buildStatsCard(
              //         'Average Attendance',
              //         '${stats['avgPercentage'].toStringAsFixed(1)}%',
              //         Icons.trending_up,
              //         AppColors.green,
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: _buildStatsCard(
              //         'Full Attendance',
              //         '${stats['fullAttendance']} Students',
              //         Icons.star,
              //         Colors.orange,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 12),
              // Row(
              //   children: [
              //     Expanded(
              //       child: _buildStatsCard(
              //         'Below 75%',
              //         '${stats['below75']} Students',
              //         Icons.warning,
              //         Colors.red,
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: _buildStatsCard(
              //         'Total Students',
              //         '${stats['totalStudents']}',
              //         Icons.people,
              //         Colors.blue,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20),

              // Monthly Report Header
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
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
                        flex: 4,
                        child: Text(
                          'Attendance Summary',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Percentage',
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
              const SizedBox(height: 12),

              // Monthly Report List
              Expanded(
                child: ListView.builder(
                  itemCount: monthlyAttendanceData.length,
                  itemBuilder: (context, index) {
                    final student = monthlyAttendanceData[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                        child: Row(
                          children: [
                            // Student Number
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Student Name
                            Expanded(
                              flex: 3,
                              child: Text(
                                student['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            // Attendance Summary
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildMiniStat('P', student['present'], AppColors.green),
                                  _buildMiniStat('A', student['absent'], Colors.red),
                                  _buildMiniStat('L', student['late'], Colors.orange),
                                  _buildMiniStat('T', student['totalDays'], Colors.blue),
                                ],
                              ),
                            ),

                            // Percentage
                            Expanded(
                              flex: 2,
                              child: _buildPercentageIndicator(student['percentage']),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Print Button
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _printReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.print, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Print Monthly Report',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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

  Widget _buildStatsCard(String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStat(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'January';
      case 2: return 'February';
      case 3: return 'March';
      case 4: return 'April';
      case 5: return 'May';
      case 6: return 'June';
      case 7: return 'July';
      case 8: return 'August';
      case 9: return 'September';
      case 10: return 'October';
      case 11: return 'November';
      case 12: return 'December';
      default: return '';
    }
  }
}