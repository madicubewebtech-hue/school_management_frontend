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
    final bool isTablet = screenWidth >= 600;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? (isTablet ? 140 : 120),
      ),
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
        padding: EdgeInsets.all(isTablet ? 10 : 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 4),
                
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
                  const SizedBox(height: 2),
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
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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