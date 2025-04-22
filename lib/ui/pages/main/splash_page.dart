import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/auth_page.dart';
import 'package:insta_app/ui/pages/main/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuth(context);
    });
    return Scaffold();
  }

  checkAuth(context) {
    if (FirebaseAuth.instance.currentUser == null) {
      MRoute.push(context, AuthPage());
    } else {
      MRoute.push(context, MainPage());
    }
  }
}


