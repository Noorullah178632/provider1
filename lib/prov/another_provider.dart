import 'package:flutter/material.dart';

class SliderClass extends ChangeNotifier {
  double _value = 0.5;
  double get value => _value;
  void setValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
