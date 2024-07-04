import 'package:digital_reader/controlllers/login_controller.dart';
import 'package:digital_reader/views/styles/input_style.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: inputStyle(labelText: 'E-mail'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        LoginController.instance.login = value;
      },
    );
  }
}