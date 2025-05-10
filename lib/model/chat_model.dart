import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
String fromUser; 
String text;
Timestamp? date;
  ChatModel({
    required this.fromUser,
    required this.text,
    this.date,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromUser': fromUser,
      'text': text,
      'date': FieldValue.serverTimestamp()
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      fromUser: map['fromUser'],
      text: map['text'],
      date: map['date'],
    );
  }
}  
