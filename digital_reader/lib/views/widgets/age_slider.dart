import 'package:digital_reader/controlllers/submit_finger_print_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgeSlider extends StatefulWidget {
  double ageSliderValue = 0;
  AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.ageSliderValue, 
      max: 12,
      min: 0,
      label: widget.ageSliderValue.toInt().toString(),
      divisions: 12,
      activeColor: Colors.teal.shade500,
      onChanged: (double value) {
        setState(() {
          widget.ageSliderValue = value;
          SubmitFingerPrintController.instance.months = value;
        });
      }
    );
  }
}