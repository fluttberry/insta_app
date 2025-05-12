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

  getUser(id) async {
    if (!profiles.map((pro) => pro.id).contains(id)) {
      var user = await _repository.getUser(id);
      if (!profiles.map((pro) => pro.id).contains(id)) {
        if (user != null) {
          setState(() {
            profiles.add(user);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                var chat = chats[index];
                var user = profiles.firstWhere(
                  (pro) => pro.id == chat.fromUser,
                  orElse:
                      () => ProfileModel(
                        name: '-',
                        nickname: '-',
                        city: '-',
                        image: '',
                      ),
                );
                return Align(
                  alignment:
                      myId == chat.fromUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 84,
                                width: 207,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(chat.text),
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                Text(user.name, style: TextStyle(fontSize: 11)),

                                if (user.image.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: ClipOval(
                                      child: Image.network(
                                        user.image,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
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
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Text',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
