import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_app/model/profile_model.dart';

class ProfileRepository {
  getProfile() {}

  editProfile( ProfileModel profile) async {
    if (profile.localImage != null) {
      var storage = FirebaseStorage.instance.ref().child(
        'fluttberry/users/${DateTime.now().millisecondsSinceEpoch}.png',
      );
      var byte = await profile.localImage!.readAsBytes();
      await storage.putData(byte);
      profile.image = await storage.getDownloadURL();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(profile.toMap());
  }
}
