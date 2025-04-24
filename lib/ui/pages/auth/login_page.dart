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
       
        children: [
          SizedBox(height: 40),
          Text(
            'Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Spacer(flex: 1),
          Container(
            height: 42,
            width: 240,
            color: Colors.grey.shade300,
            child: TextField(controller: _emailController),
          ),
          SizedBox(height: 40),
          Container(
            height: 42,
            width: 240,
            color: Colors.grey.shade300,
            child: TextField(controller: _passwordController),
          ),
          SizedBox(height: 40),

          Container(
            height: 42,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade300,
            ),
            child: InkWell(
              onTap: () async {
                var success = _authRepository.login(
                  _emailController.text,
                  _passwordController.text,
                );
                if (success == true) {
                  MRoute.replce(context, MainPage());
                }
              },
              child: Center(child: Text('login')),
            ),
          ),
          Spacer(flex: 1),
          SizedBox(height: 20),
          Text('Not have account yet?'),
          SizedBox(height: 5),

          Container(
            height: 42,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade300,
            ),
            child: InkWell(
              onTap: () {
                MRoute.push(context, RegistrationPage());
              },
              child: Center(child: Text('registration')),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
