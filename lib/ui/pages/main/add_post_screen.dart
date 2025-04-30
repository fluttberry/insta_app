import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app/model/request_post_model.dart';
import 'package:insta_app/repository/post_repository.dart';
import 'package:insta_app/ui/pages/main/home_screen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  XFile? image1;
  XFile? image2;
  XFile? image3;
  

  TextEditingController desController = TextEditingController();
  final PostRepository _postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Add',
          // textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 32),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 53, right: 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image1 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade300,
                  child: image1 != null ? Image.network(image1!.path) : null,
                ),
              ),
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image2 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade300,
                  child: image2 != null ? Image.network(image2!.path) : null,
                ),
              ),
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image3 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade300,
                  child: image3 != null ? Image.network(image3!.path) : null,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 346,
          height: 144,
          color: Colors.grey.shade300,
          child: TextFormField(controller: desController),
        ),
        SizedBox(height: 20),
        Container(
          height: 53,
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade300,
          ),
          child: InkWell(
            onTap: () {
              RequestPostModel post = RequestPostModel(
                image1: image1,
                image2: image2,
                image3: image3,
                user: FirebaseAuth.instance.currentUser!.uid,
                text: desController.text 
              );
              _postRepository.post(post) | Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Center(child: Text('Post')),
          ),
        ),
      ],
    );
  }
}
