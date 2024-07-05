import 'package:digital_reader/controllers/new_baby_controller.dart';
import 'package:digital_reader/views/styles/input_style.dart';
import 'package:flutter/material.dart';

class NewCodeInput extends StatelessWidget {
  const NewCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: inputStyle(labelText: 'Código do Bebê'),
        onChanged: (value) {
          NewBabyController.instance.code = value;
        },
      ),
    );
  }
}