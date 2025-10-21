import 'package:flutter/material.dart';

class ContainerListWidget extends StatelessWidget {
  final String title;
  final String subject;
  final String dueDate;
  final bool isCompleted;

  const ContainerListWidget({
    super.key,
    required this.title,
    required this.subject,
    required this.dueDate,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.teal;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: themeColor.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title - Allow multiple lines
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 3, // Allow up to 3 lines
              overflow: TextOverflow.visible, // Show full text
            ),
            const SizedBox(height: 8),
            
            // Subject
            Text(
              subject,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            
            // Due date and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Due: $dueDate',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.teal[700],
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.greenAccent.withOpacity(0.2)
                        : Colors.orangeAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isCompleted ? 'Done' : 'Pending',
                    style: TextStyle(
                      color: isCompleted ? Colors.green[700] : Colors.orange[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}