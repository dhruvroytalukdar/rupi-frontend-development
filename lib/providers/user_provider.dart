import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  bool _isUserLoggedIn = false;

  // Getters
  User? get loggedInUser => _user;
  bool get isUserLoggedIn => _isUserLoggedIn;

  // Setters
  UserProvider(this._user) : super() {
    setUserFromUserObject(_user);
  }

  void setUserFromUserPassword(String email, String fullName,
      String phoneNumber, double currentValue, double investedAmount) {
    _user = User(
      email: email,
      fullName: fullName,
      phoneNumber: phoneNumber,
      currentBalance: currentValue,
      investedAmount: investedAmount,
      totalReturns: (currentValue - investedAmount),
    );
    _isUserLoggedIn = true;
    notifyListeners();
  }

  void setUserFromUserObject(User? user) {
    _user = user;
    _isUserLoggedIn = true;
    notifyListeners();
  }

  void resetUser() {
    _user = null;
    _isUserLoggedIn = false;
    notifyListeners();
  }
}
