import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/login_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Scaffold(
      body: Column(
        children: [
          Text('Home'),
          ElevatedButton(
            onPressed: () {
              MRoute.replce(context, LoginPage);
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
