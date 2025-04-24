import 'package:flutter/material.dart';
import 'package:insta_app/repository/auth_repository.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/registration_page.dart';
import 'package:insta_app/ui/pages/main/main_page.dart';

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
          Text('Login'),
          TextField(controller: _emailController),
          TextField(controller: _passwordController),
          InkWell(
            onTap: () async {
             var success = _authRepository.login(_emailController.text, _passwordController.text );
             if (success == true){
              MRoute.replce(context, MainPage());
             }
            },
            child: Container(
              margin: EdgeInsets.all(12),
              color: Colors.amber,
              child: Text('login'),
            ),
          ),
          
          InkWell(
            onTap: () {
              MRoute.push(context, RegistrationPage());
            },
            child: Container(
              margin: EdgeInsets.all(12),
              color: Colors.amber,
              child: Text('registration'),
            ),
          ),
          
        ],
      ),
    );
  }
}
