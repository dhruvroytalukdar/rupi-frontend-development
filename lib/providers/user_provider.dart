import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier{

  User? _user;
  bool _isUserLoggedIn = false;

  // Getters
  User? get loggedInUser => _user;
  bool get isUserLoggedIn => _isUserLoggedIn;

  // Setters
  void setUser(String email,String fullName,String phoneNumber){
    _user = User(email:email,fullName: fullName,phoneNumber: phoneNumber);
    _isUserLoggedIn = true;
    notifyListeners();
  }

  void resetUser(){
    _user = null;
    _isUserLoggedIn = false;
    notifyListeners();
  }

}