import 'dart:developer';

import 'package:digital_reader/controllers/baby_controller.dart';
import 'package:flutter/material.dart';

class RegisterBabyButton extends StatelessWidget {
  const RegisterBabyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        BabyController.instance.createBaby();
        BabyController.instance.getBabies().then((value) {
        BabyController.instance.babyList = value!;});
        log('atualizado');
        Navigator.pop(context);
      },
      backgroundColor: Colors.teal,
      label: const Text(
        'Registrar bebê',
        style: TextStyle(
          color: Colors.white
        ),  
      ),
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}