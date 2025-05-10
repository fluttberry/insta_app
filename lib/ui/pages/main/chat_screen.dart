import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/model/chat_model.dart';
import 'package:insta_app/ui/widget/mbutton.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('chat')
        .orderBy('date')
        .snapshots()
        .listen((data) {
          for (var doc in data.docs) {}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text('-');
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Text'),
              ),
            ),
            MButton(
              expanded: false,
              onTap: () {
                ChatModel chatModel = ChatModel(
                  fromUser: FirebaseAuth.instance.currentUser!.uid,
                  text: textEditingController.text,
                );
                textEditingController.clear();
                FirebaseFirestore.instance
                    .collection('chat')
                    .add(chatModel.toMap());
              },
              text: 'Send',
            ),
          ],
        ),
      ],
    );
  }
}
