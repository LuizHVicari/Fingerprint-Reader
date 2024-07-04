import 'package:digital_reader/controlllers/current_widget_home_controller.dart';
import 'package:digital_reader/views/widgets/bottom_bar.dart';
import 'package:digital_reader/views/widgets/floating_gathering_button.dart';
import 'package:digital_reader/views/widgets/gathers_list.dart';
import 'package:digital_reader/views/widgets/home_list.dart';
import 'package:digital_reader/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [
    HomeList(),
    GathersList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: 'Coletor de Digitais'.toUpperCase()),
      body:  AnimatedBuilder(
        animation: CurrentWidgetHomeController.intance,
        builder: (context, child) {
          return 
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _pages[CurrentWidgetHomeController.intance.currentWidgetIndex],
        );
      }),
      floatingActionButton: const FloatingGatheringButton(),
      bottomNavigationBar: BottomBar(currentIndex: 0)
    );
  }
}
