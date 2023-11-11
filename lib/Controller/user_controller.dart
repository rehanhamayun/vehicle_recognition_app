import 'package:flutter/material.dart';
import 'package:vehicle_recognition/Model/user_model.dart';

class UserController with ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
