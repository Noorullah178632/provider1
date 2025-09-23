import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginApiProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  void setloading(value) {
    _loading = value;
    notifyListeners();
  }

  Future loginApi(String email, String password) async {
    setloading(true);
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        print("sucessfull");
        setloading(false);
      } else {
        print("unsucessfull");
        setloading(false);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
