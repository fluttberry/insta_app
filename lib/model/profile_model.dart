import 'dart:convert';

import 'package:image_picker/image_picker.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {

  String name;
  String nickname; 
  String city;
  XFile? localImage;
  String image;
  ProfileModel({
    required this.name,
    required this.nickname,
    required this.city,
    required this.localImage,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nickname': nickname,
      'city': city,
      'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      nickname: map['nickname'] as String,
      city: map['city'] as String,
      image: map['image'] as String,
      localImage: null,
    );
  }

  }
