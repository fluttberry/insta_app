import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/model/chat_model.dart';
import 'package:insta_app/model/profile_model.dart';
import 'package:insta_app/repository/post_repository.dart';
import 'package:insta_app/ui/widget/mbutton.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<ChatModel> chats = [];
  String myId = '';
  List<ProfileModel> profiles = [];
  final PostRepository _repository = PostRepository();
  @override
  void initState() {
    myId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('chat')
        .orderBy('date')
        .snapshots()
        .listen((data) {
          chats.clear();
          for (var doc in data.docs) {
            var chat = ChatModel.fromMap(doc.data());
            chats.add(chat);
            getUser(chat.fromUser);
          }
          setState(() {});
        });
    super.initState();
  }
  getUser (id)async{
    if (!profiles.map((pro)=>pro.id).contains(id)){
            var user = await  _repository.getUser(id);
            if (user != null) {
              profiles.add(user);
            }
            
            }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Align(
                alignment:
                    myId == chats[index].fromUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: Text(chats[index].text),
              );
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
