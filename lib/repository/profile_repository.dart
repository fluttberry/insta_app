import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_app/model/user_model.dart';

class ProfileRepository {
  getProfile () {

  }

  editProfile (String id, UserModel user)async{
String image = '';

    if (user.localImage != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/profile/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      var byte =await user.localImage! .readAsBytes();
      await storage.putData(byte);
      image = await storage.getDownloadURL();
    }
    
    await  FirebaseFirestore.instance
        .collection('users')
        .add(user.toMap(image));
  
  }
} 