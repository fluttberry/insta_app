import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
TextField(controller: _emailController,),
TextField(controller: _linkController,),
InkWell(onTap: () {
  _authRepository.sendLink(_emailController.text);

}, child: Container(color: Colors.amber, child: Text('send'),),),
    ],),);
  }
}