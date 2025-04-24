import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/login_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    throw Scaffold(
      body: Column(
        children: [
          Text('Home'),
          ElevatedButton(
            onPressed: () async {
              MRoute.replce(context, LoginPage);
              await FirebaseAuth.instance.signOut();
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
