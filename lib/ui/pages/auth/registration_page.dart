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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Registrantion'),
          TextField(controller: _emailController),
          TextField(controller: _passwordController),
          InkWell(
            onTap: () async{
            await  _authRepository.register(_emailController.text, _passwordController.text);
              MRoute.pop(context);

            },
            child: Container(
              margin: EdgeInsets.all(12),
              color: Colors.amber,
              child: Text('registration'),
            ),
          ),
          InkWell(
            onTap: () { 
              MRoute.pop(context);
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
