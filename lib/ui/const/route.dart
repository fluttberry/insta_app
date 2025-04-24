import 'package:flutter/material.dart';

class MRoute {
  static void push(context, page){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
  }
static void replce(context, page){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>page));
  }
   static void pop(context, {data}){
    Navigator.pop(context, data);
  }
} 