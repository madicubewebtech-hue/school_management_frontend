import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    color: Colors.green,
                    child: const Text(
                      'Message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
  }
}