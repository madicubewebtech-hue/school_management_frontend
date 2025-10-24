// chat_manager.dart
class ChatManager {
  static final ChatManager _instance = ChatManager._internal();
  factory ChatManager() => _instance;
  ChatManager._internal();

  final List<ChatUser> users = [
    ChatUser(
      id: '1',
      name: 'Principal',
      lastMessage: 'Please review the event schedule.',
      time: '09:45 AM',
      unreadCount: 2,
      isOnline: true,
    ),
    ChatUser(
      id: '2',
      name: 'Class Teacher',
      lastMessage: 'Submit your assignment by evening.',
      time: 'Yesterday',
      unreadCount: 0,
      isOnline: true,
    ),
    ChatUser(
      id: '3',
      name: 'Science Dept.',
      lastMessage: 'Lab timings have been updated.',
      time: '2 days ago',
      unreadCount: 1,
      isOnline: false,
    ),
    ChatUser(
      id: '4',
      name: 'Sports Coach',
      lastMessage: 'Practice starts at 6 AM sharp!',
      time: 'Oct 20',
      unreadCount: 0,
      isOnline: true,
    ),
    ChatUser(
      id: '5',
      name: 'Library',
      lastMessage: 'Reminder: Return books by Friday.',
      time: 'Oct 15',
      unreadCount: 0,
      isOnline: false,
    ),
  ];

  final Map<String, List<ChatMessage>> chatMessages = {
    '1': [
      ChatMessage(text: "Hello! Please review the event schedule for next week.", isMe: false, time: "09:45 AM"),
      ChatMessage(text: "Sure, I'll check it and get back to you.", isMe: true, time: "09:46 AM"),
      ChatMessage(text: "Great! Let me know if any changes are needed.", isMe: false, time: "09:47 AM"),
    ],
    '2': [
      ChatMessage(text: "Don't forget to submit your assignment by evening.", isMe: false, time: "Yesterday"),
      ChatMessage(text: "Working on it, will submit before deadline.", isMe: true, time: "Yesterday"),
    ],
    '3': [
      ChatMessage(text: "Lab timings have been updated for this week.", isMe: false, time: "2 days ago"),
      ChatMessage(text: "Thanks for the update!", isMe: true, time: "2 days ago"),
    ],
    '4': [
      ChatMessage(text: "Practice starts at 6 AM sharp tomorrow!", isMe: false, time: "Oct 20"),
      ChatMessage(text: "I'll be there on time coach!", isMe: true, time: "Oct 20"),
    ],
    '5': [
      ChatMessage(text: "Reminder: Return books by Friday to avoid fine.", isMe: false, time: "Oct 15"),
      ChatMessage(text: "Okay, I'll return them tomorrow.", isMe: true, time: "Oct 15"),
    ],
  };

  List<ChatUser> getOnlineUsers() {
    return users.where((user) => user.isOnline).toList();
  }

  List<ChatMessage> getMessagesForUser(String userId) {
    return chatMessages[userId] ?? [];
  }

  void sendMessage(String userId, String text) {
    final newMessage = ChatMessage(
      text: text,
      isMe: true,
      time: _getCurrentTime(),
    );
    chatMessages[userId]?.add(newMessage);
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}

class ChatUser {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
  });
}

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
  });
}