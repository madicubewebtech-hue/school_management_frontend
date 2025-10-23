import 'package:flutter/material.dart';

// ----------------- Assignment Card -----------------
class AssignmentCard extends StatelessWidget {


  final String title;
  final String subject;
  final String date;
  final bool hasAttachment;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const AssignmentCard({
    Key? key,
    required this.title,
    required this.subject,
    required this.date,
    required this.hasAttachment,
    required this.onView,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            softWrap: true,
          ),
          const SizedBox(height: 6),
          // Subject & Date Row
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.book, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    subject,
                    style: const TextStyle(color: Colors.grey),
                    softWrap: true,
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey),
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Attachment if available
          if (hasAttachment)
            Row(
              children: const [
                Icon(Icons.attachment, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'Attachment',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          if (hasAttachment) const SizedBox(height: 8),
          // Buttons Row
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onView,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'View',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: onDelete,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.red),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, size: 14, color: Colors.red),
                        SizedBox(width: 4),
                        Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

