import 'package:digital_reader/controllers/gathering_controller.dart';
import 'package:digital_reader/controllers/submit_finger_print_controller.dart';
import 'package:flutter/material.dart';


class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: GatheringController.instance.months, 
      max: 12,
      min: 0,
      label: GatheringController.instance.months.toInt().toString(),
      divisions: 12,
      activeColor: Colors.teal.shade500,
      onChanged: (double value) {
        setState(() {
          GatheringController.instance.months = value;
          SubmitFingerPrintController.instance.months = value;
        });
      }
    );
  }
}