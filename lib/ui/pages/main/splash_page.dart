import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    checkAuth(context);
    return Scaffold();
  }
}
checkAuth(context)async{
  if (FirebaseAuth.instance.currentUser==null){
    MRoute.push(context, AuthPage());
  }else{
    Mroute.push(context, MainPage());
  }
}