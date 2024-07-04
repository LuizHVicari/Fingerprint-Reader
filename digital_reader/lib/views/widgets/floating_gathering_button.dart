import 'package:flutter/material.dart';

class FloatingGatheringButton extends StatefulWidget {
  const FloatingGatheringButton({super.key});

  @override
  State<FloatingGatheringButton> createState() => _FloatingGatheringButtonState();
}
class _FloatingGatheringButtonState extends State<FloatingGatheringButton> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, '/gathering');
      }, 
      backgroundColor: Colors.teal,
      label: const Text(
        'Nova coleta',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      icon: const Icon(
        Icons.back_hand_outlined,
        color: Colors.white,),
      )
    ;
  }
}