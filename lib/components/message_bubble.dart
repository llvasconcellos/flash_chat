import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;
  final Color color;

  const MessageBubble(
      {Key? key,
      required this.sender,
      required this.text,
      required this.isMe,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 0 : 30),
              topRight: Radius.circular(isMe ? 30 : 0),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
            ),
            elevation: 5,
            color: color,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
