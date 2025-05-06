import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app/repository/profile_repository.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/login_page.dart';
import 'package:insta_app/ui/widget/mbutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  ProfileRepository _profileRepository = ProfileRepository();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: nameController,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nickname...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: nicknameController,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'City...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MButton(onTap: () {}, text: 'Save'),
              SizedBox(height: 20),
              MButton(
                onTap: () async {
                  MRoute.replce(context, LoginPage());
                  await FirebaseAuth.instance.signOut();
                },
                text: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
