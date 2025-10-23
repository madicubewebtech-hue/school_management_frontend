import 'package:flutter/material.dart';

// ----------------- Assignment Card -----------------
// assignment_widgets.dart में AssignmentCard को ऐसा बनाएं:
class AssignmentCard extends StatelessWidget {
  final String title;
  final String subject;
  final String date;
  final bool hasAttachment;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const AssignmentCard({
    super.key,
    required this.title,
    required this.subject,
    required this.date,
    required this.hasAttachment,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // ADD THIS
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, // Reduced font size
              ),
              maxLines: 2, // ADD THIS
              overflow: TextOverflow.ellipsis, // ADD THIS
            ),
            const SizedBox(height: 8),
            
            // Subject
            Text(
              'Subject: $subject',
              style: TextStyle(
                fontSize: 12, // Reduced font size
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            
            // Date
            Text(
              'Due: $date',
              style: TextStyle(
                fontSize: 12, // Reduced font size
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            
            // Attachment & Buttons
            Row(
              children: [
                if (hasAttachment)
                  Icon(Icons.attach_file, size: 16, color: Colors.green),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.visibility, size: 18),
                  onPressed: onView,
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 18, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}