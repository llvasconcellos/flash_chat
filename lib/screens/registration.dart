import 'package:flutter/material.dart';

import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/custom_text_field.dart';

class Registration extends StatefulWidget {
  static String id = 'registration';

  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
              child: Hero(tag: 'logo',
              child: Image.asset('assets/images/logo.png')),
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
              color: Colors.blueAccent,
              text: 'Register',
              onPressed: () {
                //Implement registration functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
