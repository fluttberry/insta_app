import 'package:flutter/material.dart';
import 'package:insta_app/ui/pages/main/add_post_screen.dart';
import 'package:insta_app/ui/pages/main/chat_screen.dart';
import 'package:insta_app/ui/pages/main/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          Center(child: Text('Home')),
          AddPostScreen(),
          ChatScreen(),
          ProfileScreen(),
          Column(children: []),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,

        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Rectangle.png',
              color: index == 0 ? Colors.blue : Colors.black,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Vector.png',
              color: index == 1 ? Colors.blue : Colors.black,
            ),
            label: 'add post',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Chat.png',
              color: index == 2 ? Colors.blue : Colors.black,
            ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/User.png',
              color: index == 3 ? Colors.blue : Colors.black,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}




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