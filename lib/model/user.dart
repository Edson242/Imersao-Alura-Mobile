import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User? u) {
    _user = u;
    notifyListeners();
  }
}
