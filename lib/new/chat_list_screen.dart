import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final List<Map<String, String>> chats = const [
    {
      "name": "Principal",
      "message": "Please review the event schedule.",
      "time": "09:45 AM",
    },
    {
      "name": "Class Teacher",
      "message": "Submit your assignment by evening.",
      "time": "Yesterday",
    },
    {
      "name": "Science Dept.",
      "message": "Lab timings have been updated.",
      "time": "2 days ago",
    },
    {
      "name": "Sports Coach",
      "message": "Practice starts at 6 AM sharp!",
      "time": "Oct 20",
    },
    {
      "name": "Library",
      "message": "Reminder: Return books by Friday.",
      "time": "Oct 15",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Header with title + icon
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: AppColors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.group_add, color: Colors.white, size: 22),
                ],
              ),
            ),

            // 🔹 Search bar
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600], size: 20),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search chats...",
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Chat list
            Expanded(
              child: ListView.separated(
                itemCount: chats.length,
                separatorBuilder: (_, __) => Divider(
                  color: Colors.grey[200],
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return InkWell(
                    onTap: () {},
                    splashColor: AppColors.green.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🟢 Avatar
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColors.green.withOpacity(0.15),
                            child: Text(
                              chat["name"]![0],
                              style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Name + message + time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        chat["name"]!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      chat["time"]!,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  chat["message"]!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
