

import 'package:image_picker/image_picker.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  String id;
  String name;
  String nickname; 
  String city;
  XFile? localImage;
  String image;
  ProfileModel({
    this.id = '',
    required this.name,
    required this.nickname,
    required this.city,
     this.localImage,
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
      name: map['name'] ??'',
      nickname: map['nickname'] ??'',
      city: map['city'] ??'',
      image: map['image'] ??'',
      localImage: null,
    );
  }

  }
