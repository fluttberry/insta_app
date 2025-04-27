import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/login_page.dart';
import 'package:insta_app/ui/pages/main/add_post_screen.dart';
import 'package:insta_app/ui/pages/main/chat_screen.dart';
import 'package:insta_app/ui/pages/main/profile_screen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        //index: index,
        children: [
          AddPostScreen(),
          ChatScreen(),
          ProfileScreen(),
         // Column(
            //children: [
              // ElevatedButton(
              //   onPressed: () async {
              //     MRoute.replce(context, LoginPage());
              //     await FirebaseAuth.instance.signOut();
              //   },
              //   child: Text('Exit'),
              // ),
            //],
          //),
        ],
      ),
bottomNavigationBar: BottomNavigationBar(
  showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey.shade50,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Explore_Active.png',
              color: index == 0 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Map_Inactive.png',
              color: index == 1 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Profile_Inactive.png',
              color: index == 2 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
        ],
),
    );
  }
}
