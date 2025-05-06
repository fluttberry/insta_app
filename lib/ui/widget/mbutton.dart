// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const MButton({super.key, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(padding: EdgeInsets.all(12), alignment: Alignment.center, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey[300]), width: double.infinity, child: Text(text)),
    );
  }
}
