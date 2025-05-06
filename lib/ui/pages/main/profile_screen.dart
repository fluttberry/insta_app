import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app/model/profile_model.dart';
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
  ProfileModel? profileModel;
  XFile? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final ProfileRepository _repository = ProfileRepository();

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  getProfile() async {
    var profile = await _repository.getProfile();
    setState(() {
      profile = profile;
      nameController.text = profile.name;
      nicknameController.text = profile.nickName;
      cityController.text = profile.city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (img != null) {
                    setState(() {
                      image = img;
                    });
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    height: 112,
                    width: 112,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child:
                        image != null
                            ? Image.file(File(image!.path), fit: BoxFit.cover,)
                            : profileModel?.image.isNotEmpty == true
                            ? Image.network(profileModel!.image)
                            : null,
                  ),
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
              MButton(
                onTap: () {
                  ProfileModel profileModel = ProfileModel(
                    name: nameController.text,
                    nickname: nicknameController.text,
                    city: cityController.text,
                    localImage: image,
                    image: this.profileModel?.image??'',
                  );
                  _repository.editProfile(profileModel);
                },
                text: 'Save',
              ),
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
