import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future <dynamic> login (email, password) async {
   try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    // print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    // print('Wrong password provided for that user.');
  } else {
    // print(e);
  }
} catch (e){
  // print(e);
}
  }
  register (email, password, ) async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email ,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    // print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    // print('The account already exists for that email.');
  }
} catch (e) {
  // print(e);
}

  }
}