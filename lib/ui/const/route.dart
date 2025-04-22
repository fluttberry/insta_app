import 'package:flutter/material.dart';

class MRoute {
  static void push(context, page){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
  }
}