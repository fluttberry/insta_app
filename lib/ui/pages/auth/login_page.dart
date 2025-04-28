import 'package:flutter/material.dart';
import 'package:insta_app/repository/auth_repository.dart';
import 'package:insta_app/ui/const/route.dart';
import 'package:insta_app/ui/pages/auth/registration_page.dart';
import 'package:insta_app/ui/pages/main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40, width: double.infinity),
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
            child: TextField(
              controller: _passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
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
                var success = await _authRepository.login(
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
