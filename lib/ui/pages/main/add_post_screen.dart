import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add'),
        Row(
          children: [
            InkWell(
              onTap: () async {
                var img = await ImagePicker().pickImage(
                  source: ImageSource.gallery, imageQuality: 50
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
                child: image1 != null ? Image.file(File(image1!.path)) : null,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: image2 != null ? Image.file(File(image2!.path)) : null,
            ),
            Container(
              width: 100,
              height: 100,
              child: image3 != null ? Image.file(File(image3!.path)) : null,
            ),
          ],
        ),
        TextFormField(controller: desController),
        ElevatedButton(onPressed: () {}, child: Text('Post')),
      ],
    ); 
  }
}
