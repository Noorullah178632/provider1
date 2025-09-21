import 'package:flutter/material.dart';

class ThememodeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get thememode => _themeMode;
  void changeThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
