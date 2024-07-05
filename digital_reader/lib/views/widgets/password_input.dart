import 'package:digital_reader/controllers/login_controller.dart';
import 'package:digital_reader/views/styles/input_style.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: inputStyle(labelText: 'Senha'),
      keyboardType: TextInputType.text,
      onChanged:(value) {
        LoginController.instance.password = value;
      },
    );
  }
}