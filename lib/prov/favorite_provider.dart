import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;
  void addItem(var value) {
    selectedItems.contains(value)
        ? selectedItems.remove(value)
        : selectedItems.add(value);
    notifyListeners();
  }
}
