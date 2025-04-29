import 'package:insta_app/model/request_post_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class PostRepository {
  post(RequestPostModel post){
    FirebaseStorage.instance.ref().child('fluttberry/post/');
    FirebaseFirestore.instance.
  }
}