import 'package:flutter/material.dart';

class RegisterBabyButton extends StatelessWidget {
  const RegisterBabyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // TODO enviar para o banco de dados

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