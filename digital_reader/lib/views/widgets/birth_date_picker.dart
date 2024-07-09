import 'package:digital_reader/controllers/baby_controller.dart';
import 'package:flutter/material.dart';

class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({super.key});

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        controller: dateController,
        decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(
            color: Colors.teal
          ),
          labelText: 'Data de nascimento',
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal
            )
          )
        ),
        readOnly: true,
        onTap: () {
          _bornDate();
        },
      ),
    );
  }

  Future<void> _bornDate() async {
    DateTime? date = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), 
      lastDate: DateTime.now()
      );

    if (date != null) {
      setState(() {
        dateController.text = date.toString().split(" ")[0];
        BabyController.instance.birthDate = date.toString().split(" ")[0];
      });
    }
  }
}