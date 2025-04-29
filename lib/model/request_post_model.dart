import 'package:image_picker/image_picker.dart';

class RequestPostModel {

  XFile? image1;
  XFile? image2;
  XFile? image3;
  String user;
  String text;
RequestPostModel ({required this.image1, required this.image2, required this.image3, required this.user, required this.text,});

Map<String, dynamic> toJson(image1Url, image2Url, image3Url) {
    return {
      'image1': image1Url,
      'image2': image2Url,
      'image3': image3Url,
      'user': user,
      'text': text,
    };
  }

} 