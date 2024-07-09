import 'dart:developer';

import 'package:digital_reader/controllers/gathering_controller.dart';
import 'package:digital_reader/models/gathering_model.dart';
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
      itemCount: GatheringController.instance.gatherings!.length,
      itemBuilder: (context, index) {
        return GatherCart(
          code: GatheringController.instance.gatherings![index].baby.toString(), 
          date: GatheringController.instance.gatherings![index].createdAt!,
          months: GatheringController.instance.gatherings![index].months!);
      },
    );
  }

  
}