import 'package:flutter/material.dart';

ButtonStyle segmentedButtonStyle() {
  return ButtonStyle(
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
  );
}