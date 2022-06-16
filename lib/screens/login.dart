import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/custom_text_field.dart';

import 'chat.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
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
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onPressed: () async {
                  setState((){
                    _showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    setState((){
                      _showSpinner = false;
                      if (!mounted) return;
                      Navigator.pushNamed(context, Chat.id);
                    });
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
      ),
    );
  }
}
