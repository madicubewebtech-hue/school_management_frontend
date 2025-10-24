// chat_list_screen.dart - SIMPLIFIED VERSION
import 'package:flutter/material.dart';
import 'package:school_management_frontend/new/chat/chat.dart';
import 'package:school_management_frontend/theme/app_colors.dart';
import 'chat_manager.dart';

class ChatListScreen extends StatelessWidget {
  // Remove the onUserSelected parameter since we're not using wrapper
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final bool isTablet = screenWidth >= 768 && screenWidth < 1200;
    final bool isDesktop = screenWidth >= 1200;

    return Scaffold(
      backgroundColor: isDesktop ? Colors.transparent : Colors.grey[50],
      body: isMobile ? _buildMobileLayout(context) : _buildDesktopTabletLayout(context, isTablet, isDesktop),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // 🔹 Mobile Header
          _buildHeader(isMobile: true),
          // 🔹 Search Bar for Mobile
          _buildSearchBar(isMobile: true),
          // 🔹 Chat List for Mobile
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _buildChatList(context, isMobile: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTabletLayout(BuildContext context, bool isTablet, bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: isDesktop 
            ? const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )
            : BorderRadius.zero,
        boxShadow: isDesktop 
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(-5, 0),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          // 🔹 Desktop/Tablet Header
          _buildHeader(isTablet: isTablet, isDesktop: isDesktop),
          // 🔹 Search Bar for Desktop/Tablet
          _buildSearchBar(isTablet: isTablet, isDesktop: isDesktop),
          // 🔹 Online Users for Desktop
          if (isDesktop) _buildOnlineUsers(),
          // 🔹 Chat List for Desktop/Tablet
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                isTablet ? 8 : 12,
                0,
                isTablet ? 8 : 12,
                isTablet ? 8 : 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _buildChatList(context, isMobile: false, isTablet: isTablet),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({bool isMobile = false, bool isTablet = false, bool isDesktop = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 20 : 24),
        vertical: isMobile ? 16 : (isTablet ? 16 : 20),
      ),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: isDesktop 
            ? const BorderRadius.only(topLeft: Radius.circular(25))
            : (isMobile ? const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)) : BorderRadius.zero),
        gradient: isDesktop 
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.green, AppColors.green.withOpacity(0.9)],
              )
            : null,
        boxShadow: [
          if (isMobile) BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isMobile ? "Chats" : "Messages",
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 20 : (isTablet ? 18 : 20),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              if (!isMobile) IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_list, color: Colors.white, size: isTablet ? 20 : 22),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.group_add, color: Colors.white, size: isMobile ? 24 : (isTablet ? 20 : 22)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar({bool isMobile = false, bool isTablet = false, bool isDesktop = false}) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 16 : 20)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: isMobile ? 8 : 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isMobile ? 15 : 12),
          border: !isMobile ? Border.all(color: Colors.grey[300]!) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isMobile ? 0.05 : 0.03),
              blurRadius: isMobile ? 5 : 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[500], size: 20),
            const SizedBox(width: 12),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search conversations...",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            if (!isMobile) ...[
              Container(width: 1, height: 20, color: Colors.grey[300]),
              const SizedBox(width: 12),
              Icon(Icons.tune, color: Colors.grey[500], size: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOnlineUsers() {
    final onlineUsers = ChatManager().getOnlineUsers();
    
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Online Now",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: onlineUsers.map((user) => _buildOnlineUser(user)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnlineUser(ChatUser user) {
    return SizedBox(
      width: 60,
      height: 45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.green.withOpacity(0.15),
                child: Text(
                  user.name[0],
                  style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              if (user.isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 1.2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Flexible(
            child: Text(
              _truncateName(user.name),
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 1.1),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(BuildContext context, {bool isMobile = false, bool isTablet = false}) {
    final users = ChatManager().users;
    
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (_, __) => Divider(
        color: Colors.grey[200],
        height: 1,
        indent: isMobile ? 16 : 20,
        endIndent: isMobile ? 16 : 20,
      ),
      itemBuilder: (context, index) {
        final user = users[index];
        
        return InkWell(
          onTap: () => _navigateToChatScreen(context, user),
          splashColor: AppColors.green.withOpacity(0.1),
          highlightColor: AppColors.green.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 20,
              vertical: isMobile ? 12 : 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar with status
                Stack(
                  children: [
                    CircleAvatar(
                      radius: isTablet ? 20 : 24,
                      backgroundColor: AppColors.green.withOpacity(0.15),
                      child: Text(
                        user.name[0],
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 14 : 16,
                        ),
                      ),
                    ),
                    if (user.unreadCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),

                // Chat info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTablet ? 14 : 16,
                                color: user.unreadCount > 0 ? Colors.black : Colors.grey[700],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            user.time,
                            style: TextStyle(
                              fontSize: isTablet ? 10 : 12,
                              color: Colors.grey[500],
                              fontWeight: user.unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.lastMessage,
                              style: TextStyle(
                                color: user.unreadCount > 0 ? Colors.grey[800] : Colors.grey[600],
                                fontSize: isTablet ? 12 : 13,
                                fontWeight: user.unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          if (user.unreadCount > 0)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                user.unreadCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // SIMPLE NAVIGATION - No desktop wrapper needed
  void _navigateToChatScreen(BuildContext context, ChatUser user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(user: user),
      ),
    );
  }

  String _truncateName(String name) {
    return name.length > 6 ? '${name.substring(0, 6)}...' : name;
  }
}