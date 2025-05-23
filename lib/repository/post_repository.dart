import 'package:insta_app/model/profile_model.dart';
import 'package:insta_app/model/request_post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_app/model/response_post_model.dart';

class PostRepository {
  Future<void> post(RequestPostModel post) async {
    String image1Url = '';
    String image2Url = '';
    String image3Url = '';

    if (post.image1 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      var byte = await post.image1!.readAsBytes();
      await storage.putData(byte);
      image1Url = await storage.getDownloadURL();
    }
    if (post.image2 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      var byte = await post.image2!.readAsBytes();
      await storage.putData(byte);
      image2Url = await storage.getDownloadURL();
    }
    if (post.image3 != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/post/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      var byte = await post.image3!.readAsBytes();
      await storage.putData(byte);
      image3Url = await storage.getDownloadURL();
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .add(post.toJson(image1Url, image2Url, image3Url));
  }

  Future<List<ResponsePostModel>> getPosts() async {
    List<ResponsePostModel> posts = [];
    var docs =
        await FirebaseFirestore.instance.collection('posts').limit(10).get();
    for (var doc in docs.docs) {
      ResponsePostModel post = ResponsePostModel.fromJson(doc.data());
      post.id = doc.id;
      posts.add(post);
    }
    return posts;
  }

  Future<ProfileModel?> getUser(String id) async {
    var doc = await FirebaseFirestore.instance.collection('users').doc(id).get();
if (doc.data() == null) return null;
    var profile = ProfileModel.fromMap(doc.data()!);
    profile.id = doc.id;
    return profile;
  }
}
