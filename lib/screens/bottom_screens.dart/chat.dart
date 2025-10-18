import 'package:flutter/material.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Center(child: Text('Chat',style: TextStyle(color: Colors.white ,),)),
        backgroundColor: AppColors.green,
        elevation: 2,
      ),
      body: Column(
        children: [
          // Dummy chat messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Hello! How are you?",
                    isMe: false,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "I'm good, thanks! What about you?",
                    isMe: true,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Just testing this dummy chat screen 😄",
                    isMe: false,
                  ),
                ),
              ],
            ),
          ),

          // Message input area (non-functional for now)
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: AppColors.green,
                  child: Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isMe ? 50 : 0,
        right: isMe ? 0 : 50,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? AppColors.green.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
          bottomRight: isMe ? Radius.zero : const Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
      ),
    );
  }
}
