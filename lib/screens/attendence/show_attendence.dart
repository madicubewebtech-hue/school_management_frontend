import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/new/chat/chat_list_screen.dart';
import 'package:school_management_frontend/widgets/sidebar_navigation.dart';

class MonthlyAttendanceReportScreen extends StatefulWidget {
  const MonthlyAttendanceReportScreen({super.key});

  @override
  State<MonthlyAttendanceReportScreen> createState() =>
      _MonthlyAttendanceReportScreenState();
}

class _MonthlyAttendanceReportScreenState
    extends State<MonthlyAttendanceReportScreen> {
  DateTime selectedMonth = DateTime.now();
  String? selectedClass = 'Class 1';
  final List<String> classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5'
  ];

  final List<Map<String, dynamic>> monthlyAttendanceData = [
    {'name': 'Rahul Sharma', 'totalDays': 22, 'present': 20, 'absent': 2, 'late': 0, 'percentage': 90.9},
    {'name': 'Priya Singh', 'totalDays': 22, 'present': 22, 'absent': 0, 'late': 0, 'percentage': 100.0},
    {'name': 'Amit Kumar', 'totalDays': 22, 'present': 18, 'absent': 3, 'late': 1, 'percentage': 81.8},
    {'name': 'Sneha Patel', 'totalDays': 22, 'present': 21, 'absent': 1, 'late': 0, 'percentage': 95.5},
    {'name': 'Rohit Verma', 'totalDays': 22, 'present': 19, 'absent': 2, 'late': 1, 'percentage': 86.4},
    {'name': 'Neha Gupta', 'totalDays': 22, 'present': 22, 'absent': 0, 'late': 0, 'percentage': 100.0},
    {'name': 'Karan Malhotra', 'totalDays': 22, 'present': 20, 'absent': 1, 'late': 1, 'percentage': 90.9},
    {'name': 'Pooja Joshi', 'totalDays': 22, 'present': 17, 'absent': 4, 'late': 1, 'percentage': 77.3},
    {'name': 'Vikram Singh', 'totalDays': 22, 'present': 21, 'absent': 1, 'late': 0, 'percentage': 95.5},
    {'name': 'Anjali Reddy', 'totalDays': 22, 'present': 16, 'absent': 5, 'late': 1, 'percentage': 72.7},
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
      setState(() => selectedMonth = picked);
    }
  }

  void _printReport() {
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: AutoSizeText(
          '${percentage.toStringAsFixed(1)}%',
          maxLines: 1,
          minFontSize: 8,
          maxFontSize: 14,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

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
      backgroundColor: Colors.white,
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
        title: const AutoSizeText(
          'Demo Public School',
          maxLines: 1,
          minFontSize: 14,
          maxFontSize: 20,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildMonthlyReportContent(),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: const AutoSizeText(
          'Demo Public School',
          maxLines: 1,
          minFontSize: 14,
          maxFontSize: 20,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildMonthlyReportContent(),
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
                          'Monthly Attendance Report',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Monthly Report Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildMonthlyReportContent(isDesktop: true),
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

  // Common Monthly Report Content
  Widget _buildMonthlyReportContent({bool isDesktop = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB), Color(0xFF80CBC4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 20 : (isMobile ? 10 : 20)),
        child: Column(
          children: [
            // Month & Class Row
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
              padding: EdgeInsets.all(isMobile ? 10 : 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double availableWidth = constraints.maxWidth;
                  double itemWidth = (availableWidth - 20) / 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: itemWidth, child: _buildMonthPicker(isMobile)),
                      const SizedBox(width: 10),
                      SizedBox(width: itemWidth, child: _buildClassDropdown(isMobile)),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Table Header
            Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 10 : 14,
                horizontal: isMobile ? 8 : 16,
              ),
              child: Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: AutoSizeText(
                      'Student Name',
                      maxLines: 1,
                      minFontSize: 10,
                      maxFontSize: 16,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: AutoSizeText(
                      'Attendance ',
                      maxLines: 1,
                      minFontSize: 10,
                      maxFontSize: 16,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      'age%',
                      maxLines: 1,
                      minFontSize: 10,
                      maxFontSize: 16,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Student List
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
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 12 : 16,
                          horizontal: isMobile ? 8 : 12),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.green.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '${index + 1}',
                                maxLines: 1,
                                minFontSize: 8,
                                maxFontSize: 14,
                                style: const TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: AutoSizeText(
                              student['name'],
                              maxLines: 1,
                              minFontSize: 10,
                              maxFontSize: 16,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                _buildMiniStat(
                                    'P', student['present'], AppColors.green, isMobile),
                                _buildMiniStat(
                                    'A', student['absent'], Colors.red, isMobile),
                                _buildMiniStat(
                                    'L', student['late'], Colors.orange, isMobile),
                                _buildMiniStat(
                                    'T', student['totalDays'], Colors.blue, isMobile),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: _buildPercentageIndicator(
                                student['percentage']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Print Button
            SizedBox(
              width: double.infinity,
              height: isMobile ? 50 : 60,
              child: ElevatedButton.icon(
                onPressed: _printReport,
                icon: const Icon(Icons.print, color: Colors.white),
                label: const AutoSizeText(
                  'Print Monthly Report',
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 18,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Month Picker
  Widget _buildMonthPicker(bool isMobile) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const AutoSizeText(
        'Select Month',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.green,
        ),
        maxLines: 1,
        minFontSize: 10,
        maxFontSize: 16,
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
              const Icon(Icons.calendar_today, size: 18, color: AppColors.green),
              const SizedBox(width: 6),
              Flexible(
                child: AutoSizeText(
                  '${_getMonthName(selectedMonth.month)} ${selectedMonth.year}',
                  style: const TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  // Class Dropdown
  Widget _buildClassDropdown(bool isMobile) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const AutoSizeText(
        'Select Class',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.green,
        ),
        maxLines: 1,
        minFontSize: 10,
        maxFontSize: 16,
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
                child: AutoSizeText(
                  classItem,
                  style: const TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 16,
                  overflow: TextOverflow.ellipsis,
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
  );

  // Mini Stat
  Widget _buildMiniStat(String label, int value, Color color, bool isMobile) {
    return Column(
      children: [
        AutoSizeText(label,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 14,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        AutoSizeText(value.toString(),
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 14,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month];
  }
}