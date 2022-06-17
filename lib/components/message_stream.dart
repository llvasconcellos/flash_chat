import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_color/random_color.dart';

import 'message_bubble.dart';

final _firestore = FirebaseFirestore.instance;

class MessageStream extends StatelessWidget {
  final User loggedInUser;
  final RandomColor _randomColor = RandomColor();

  MessageStream({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        List<Widget> messageBubbles = [];
        Map<String, Color> users = {};
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final userEmail = loggedInUser.email;
          final sender = message.get('sender');
          Color color;
          if (userEmail == sender) {
            color = Colors.lightBlueAccent;
          } else if (!users.containsKey(sender)) {
            color = _randomColor.randomColor(
                colorBrightness: ColorBrightness.light);
            users.addAll({sender: color});
          } else {
            color = users[sender]!;
          }
          final messageBubble = MessageBubble(
            isMe: (userEmail == sender),
            sender: sender,
            text: message.get('text'),
            color: color,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
