import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String username;
  Auth({
    required this.username,
  });
  void toggleUsername(String name) {
    username = name;
    notifyListeners();
  }
}