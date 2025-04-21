import 'package:flutter/material.dart';

class MRout {
  static void push(context, page){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
  }
}