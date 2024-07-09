import 'package:digital_reader/controllers/gathering_controller.dart';
import 'package:flutter/material.dart';

class SubmitFingerprintButton extends StatelessWidget {
  const SubmitFingerprintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.teal,
      label: const Text(
        'Enviar dados',
        style: TextStyle(
          color: Colors.white
        ),),
      icon: const Icon(Icons.send, color: Colors.white,),
      onPressed: () {
        GatheringController.instance.createGathering();

        showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return const AlertDialog(
              title: Text(
                textAlign: TextAlign.center,
                'Formulário enviado',
                style: TextStyle(
                  fontSize: 15,
                ),),
            );
          }
        ).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
        });
      }
    );
  }
}