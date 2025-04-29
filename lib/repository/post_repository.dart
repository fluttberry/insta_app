import 'dart:io';

import 'package:insta_app/model/request_post_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostRepository {
  post(RequestPostModel post) async {
    String image1Url = '';
    String image2Url = '';
    String image3Url = '';

    if (post.image1 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await storage.putFile(File(post.image1!.path));
      image1Url = await storage.getDownloadURL();
    }
    if (post.image2 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await storage.putFile(File(post.image2!.path));
      image2Url = await storage.getDownloadURL();
    }
    if (post.image3 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await storage.putFile(File(post.image3!.path));
      image3Url = await storage.getDownloadURL();
    }
    FirebaseFirestore.instance.collection('posts').add(post.toJson(image1Url, image2Url, image3Url));
  }
}
