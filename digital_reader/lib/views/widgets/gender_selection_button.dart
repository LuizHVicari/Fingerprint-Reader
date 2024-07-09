import 'package:digital_reader/controllers/baby_controller.dart';
import 'package:digital_reader/views/styles/segmented_button_style.dart';
import 'package:flutter/material.dart';

class GenderSelectionButton extends StatefulWidget {
  const GenderSelectionButton({super.key});

  @override
  State<GenderSelectionButton> createState() => _GenderSelectionButtonState();
}

class _GenderSelectionButtonState extends State<GenderSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      style: segmentedButtonStyle(),
      segments: const [
        ButtonSegment(
          value: 'M',
          label: Text('Masculino'),
          icon: Icon(Icons.male_rounded)
        ),
        ButtonSegment(
          value: 'F',
          label: Text('Feminino'),
          icon: Icon(Icons.female)
        )
      ], 
      selected: <String>{BabyController.instance.gender},
      onSelectionChanged: (value) {
        setState(() {
          BabyController.instance.gender = value.first;
        });
      },
    );
  }
}