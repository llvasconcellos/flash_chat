import 'package:flutter/material.dart';

import 'package:flash_chat/constants.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black54,
      ),
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
      ),
    );
  }
}
