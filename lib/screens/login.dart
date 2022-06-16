import 'package:flutter/material.dart';

import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/custom_text_field.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Hero(
                tag: 'logo',
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 48),
            CustomTextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              hintText: 'Enter your email.',
            ),
            const SizedBox(height: 8),
            CustomTextField(
                 onChanged: (value) {
                  //Do something with the user input.
                },
                hintText: 'Enter your password.',
            ),
            const SizedBox(height: 24),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Log In',
              onPressed: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}