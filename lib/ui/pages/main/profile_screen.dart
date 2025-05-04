import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app/repository/profile_repository.dart';

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
    return Center(child: Text('Profile Screen'));
  }
} 