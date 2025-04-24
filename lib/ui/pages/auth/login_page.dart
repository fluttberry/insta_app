import 'package:flutter/material.dart';
import 'package:insta_app/repository/auth_repository.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: _emailController),
          TextField(controller: _passwordController),
          InkWell(
            onTap: () {
              _authRepository.login(_emailController.text, _passwordController.text );
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
