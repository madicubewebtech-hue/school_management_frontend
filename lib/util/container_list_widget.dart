import 'package:flutter/material.dart';

class PerfectFitContainerWidget extends StatelessWidget {
  final String title;
  final String subject;
  final String dueDate;
  final bool isCompleted;
  final Color themeColor;

  const PerfectFitContainerWidget({
    Key? key,
    required this.title,
    required this.subject,
    required this.dueDate,
    required this.isCompleted,
    required this.themeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: 100,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: themeColor.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title - Fixed height
            SizedBox(
              height: 32,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Subject and Due Date in one row
            Row(
              children: [
                Expanded(
                  child: Text(
                    subject,
                    style: TextStyle(
                      fontSize: 10,
                      color: themeColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  dueDate,
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            // Status badge
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.greenAccent.withOpacity(0.2)
                    : Colors.orangeAccent.withOpacity(0.25),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  isCompleted ? 'Done' : 'Pending',
                  style: TextStyle(
                    color: isCompleted ? Colors.green[700] : Colors.orange[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}