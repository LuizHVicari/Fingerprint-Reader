import 'dart:async';
import 'package:digital_reader/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class NewBabyPage extends StatefulWidget {
  const NewBabyPage({super.key});

  @override
  State<NewBabyPage> createState() => _NewBabyPageState();
}

class _NewBabyPageState extends State<NewBabyPage> {
  String code = '';
  String gender = 'M';
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Registrar novo bebê'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newCodeTextField(),
            const SizedBox(height: 20),
            datePickerTap(),
            const SizedBox(height: 20,),
            genderSelectionButton(),
            const SizedBox(height: 20),
            sendButton(context)
          ],
        )
      )
    );
  }

  FloatingActionButton sendButton(BuildContext context) {
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

  TextField datePickerTap() {
    return TextField(
      controller: _dateController,
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
        _dateController.text = date.toString().split(" ")[0];
      });
    }
  }

  Widget newCodeTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(
            color: Colors.teal
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal
            )
          ),
          labelText: 'Código do bebê',
        ),
        onChanged: (value) {
          code = value;
        },
      ),
    );
  }

  SegmentedButton<String> genderSelectionButton() {
    return SegmentedButton(
      showSelectedIcon: false,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) =>
            states.contains(WidgetState.selected) ?
            Colors.teal
            :
            Colors.teal.shade50,
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => 
            states.contains(WidgetState.selected) ?
            Colors.teal.shade50
            :
            Colors.teal.shade900,
        ),
      ),
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
      selected: <String>{gender},
      onSelectionChanged: (value) {
        setState(() {
          gender = value.first;
        });
      },
    );
  }
}