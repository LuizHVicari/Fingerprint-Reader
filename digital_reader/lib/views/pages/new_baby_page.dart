import 'package:digital_reader/views/widgets/birth_date_picker.dart';
import 'package:digital_reader/views/widgets/gender_selection_button.dart';
import 'package:digital_reader/views/widgets/new_code_input.dart';
import 'package:digital_reader/views/widgets/register_baby_button.dart';
import 'package:digital_reader/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class NewBabyPage extends StatelessWidget {
  const NewBabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Registrar novo bebê'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NewCodeInput(),
            SizedBox(height: 20),
            BirthDatePicker(),
            SizedBox(height: 20,),
            GenderSelectionButton(),
            SizedBox(height: 20),
            RegisterBabyButton(),
          ],
        )
      )
    );
  }
}