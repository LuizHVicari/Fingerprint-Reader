import 'package:flutter/material.dart';

class CurrentWidgetHomeController extends ChangeNotifier {
  static CurrentWidgetHomeController intance = CurrentWidgetHomeController();

  int currentWidgetIndex = 0;

  changeWidget({required int newIndex}) {
    currentWidgetIndex = newIndex;
    notifyListeners();
  }
}