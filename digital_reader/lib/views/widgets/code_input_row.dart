import 'package:flutter/material.dart';

class CodeInputRow extends StatelessWidget {
  const CodeInputRow({super.key});
  final List<String> ids = const ['item 1', 'item 2', 'item 3', 'item 4'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownMenu(
          hintText: 'Código do bebê',
          enableFilter: true,
          enableSearch: true,
          dropdownMenuEntries: ids.map((map) {
            return DropdownMenuEntry(
              value: map,
              label: map
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