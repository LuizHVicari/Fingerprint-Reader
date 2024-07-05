import 'package:flutter/material.dart';

class NewBabyController {
  late String? code;
  late String gender = 'M';
  final TextEditingController dateController = TextEditingController();


  static NewBabyController instance = NewBabyController();

}