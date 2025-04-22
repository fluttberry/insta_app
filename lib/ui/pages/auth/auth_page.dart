import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: _emailController),
          TextField(controller: _linkController),
          InkWell(
            onTap: () {
              _authRepository.sendLink(_emailController.text);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              color: Colors.amber,
              child: Text('send'),
            ),
          ),
          InkWell(
            onTap: () {
              _authRepository.vrifyLink(_emailController.text);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              color: Colors.amber,
              child: Text('login'),
            ),
          ),
        ],
      ),
    );
  }
}
