import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/screens/welcome.dart';
import 'package:flash_chat/screens/chat.dart';
import 'package:flash_chat/screens/login.dart';
import 'package:flash_chat/screens/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}
class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Login.id: (context) => const Login(),
        Registration.id: (context) => const Registration(),
        Chat.id: (context) => const Chat(),
      },
    );
  }
}
