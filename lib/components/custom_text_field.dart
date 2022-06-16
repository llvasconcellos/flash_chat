import 'package:flutter/material.dart';

import 'package:flash_chat/constants.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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