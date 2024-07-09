import 'package:digital_reader/controllers/baby_controller.dart';
import 'package:digital_reader/models/baby_model.dart';
import 'package:flutter/material.dart';

class CodeInputRow extends StatelessWidget {
  final List<BabyModel>? babies;
  const CodeInputRow({super.key, required this.babies});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownMenu(
          hintText: 'Código do bebê',
          enableFilter: true,
          enableSearch: true,
          dropdownMenuEntries: BabyController.instance.babyList.map((baby) {
            return DropdownMenuEntry(
              value: baby.id,
              label: baby.code!
            );
          }).toList()
        ),
        const Text('ou'),
        FloatingActionButton.extended(
          backgroundColor: Colors.teal.shade500,
          onPressed: () {
            Navigator.of(context).pushNamed('/new_baby');
          }, 
          label: const Text(
            'Novo bebê',
            style: TextStyle(color: Colors.white)
            ),
          icon: const Icon(Icons.add, color: Colors.white)
        ),
      ],
    );
  }
}