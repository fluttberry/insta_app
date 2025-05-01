import 'dart:convert';


class ResponsePostModel {
  String id;
  String image1;
  String image2;
  String image3;
  String user;
  String text;
  ResponsePostModel({
    required this.id,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.user,
    required this.text,
  });

  factory ResponsePostModel.fromJson(map ) {
   
    return ResponsePostModel(
      id: '',
      image1: map['image1'],
      image2: map['image2'],
      image3: map['image3'],
      user: map['user'],
      text: map['text'],
    );
  }
}
