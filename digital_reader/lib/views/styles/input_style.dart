import 'package:flutter/material.dart';

InputDecoration inputStyle({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
      floatingLabelStyle: TextStyle(
        color: Colors.teal,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal
        )
      )
    );
  }