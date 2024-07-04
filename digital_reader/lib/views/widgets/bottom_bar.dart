import 'dart:developer';

import 'package:digital_reader/controlllers/current_widget_home_controller.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  int currentIndex = 0;
  BottomBar({super.key, required this.currentIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.teal.shade50,
        indicatorColor: Colors.teal.shade100,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)
          : const TextStyle(color: Colors.black),
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: (int index){
           setState(() {
            log(index.toString());
            widget.currentIndex = index;
            CurrentWidgetHomeController.intance.changeWidget(newIndex: index);
           });
        },
        selectedIndex: widget.currentIndex,
        destinations: const [
          NavigationDestination(selectedIcon: Icon(Icons.home, color: Colors.teal), icon: Icon(Icons.home_outlined, color: Colors.black), label: 'Início'),
          NavigationDestination(selectedIcon: Icon(Icons.fingerprint, color: Colors.teal), icon: Icon(Icons.fingerprint, color: Colors.black), label: 'Coletas'),
        ],
      ),
    );
  }
}