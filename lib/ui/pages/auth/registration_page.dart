import 'package:flutter/material.dart';
import 'package:insta_app/repository/auth_repository.dart';
import 'package:insta_app/ui/const/route.dart';

class RegistrationPage extends StatelessWidget {
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
            'Registration',
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
                await _authRepository.register(
                  _emailController.text,
                  _passwordController.text,
                );
                MRoute.pop(context);
              },

              child: Center(child: Text('registration')),
            ),
          ),

          Spacer(flex: 1),
          SizedBox(height: 20),
          Text('Already have an account?'),
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
                MRoute.pop(context);
              },
              child: Center(child: Text('login')),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
