import 'package:digital_reader/views/widgets/gather_cart.dart';
import 'package:flutter/material.dart';

class GathersList extends StatefulWidget {
  const GathersList({super.key});

  @override
  State<GathersList> createState() => _GathersListState();
}

class _GathersListState extends State<GathersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return GatherCart(code: '000.000.0000-$index', date: '$index/01/2024', months: index);
      },
    );
  }

  
}