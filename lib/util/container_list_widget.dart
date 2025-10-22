import 'package:flutter/material.dart';

class ContainerListWidget extends StatelessWidget {
  final String title;
  final String subject;
  final String dueDate;
  final bool isCompleted;
  final double? maxHeight;

  const ContainerListWidget({
    super.key,
    required this.title,
    required this.subject,
    required this.dueDate,
    this.isCompleted = false,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.teal;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth >= 600; // simple tablet breakpoint

    return Container(
      // Allow parent to pass a maxHeight, otherwise use tablet heuristic
      constraints: maxHeight != null
          ? BoxConstraints(maxHeight: maxHeight!)
          : (isTablet ? const BoxConstraints(maxHeight: 140) : null),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeColor.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: themeColor.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 10 : 12),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Shrink to fit content
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                
                // Subject
                Text(
                  subject,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                
                // Due date
                Text(
                  'Due: $dueDate',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Status at bottom - sized to content
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.greenAccent.withOpacity(0.2)
                    : Colors.orangeAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isCompleted ? 'Done' : 'Pending',
                style: TextStyle(
                  color: isCompleted ? Colors.green[700] : Colors.orange[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}