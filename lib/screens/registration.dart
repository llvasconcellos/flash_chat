import 'package:flash_chat/screens/chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/custom_text_field.dart';

class Registration extends StatefulWidget {
  static String id = 'registration';

  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';

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
                  tag: 'logo', child: Image.asset('assets/images/logo.png')),
            ),
            const SizedBox(height: 48),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email.',
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextField(
              obscureText: true,
              hintText: 'Enter your password.',
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 24),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  if (!mounted) return;
                  Navigator.pushNamed(context, Chat.id);
                } catch(e){
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
