import 'package:flutter/material.dart';

class WithdrawStatusProvider extends ChangeNotifier {
  bool _isPaymentComplete = false;
  bool _isDoingPayment = false;
  bool _isPaymentSuccessful = false;

  // Getters
  bool get getPaymentCompleteStatus => _isPaymentComplete;
  bool get getDoingPaymentStatus => _isDoingPayment;
  bool get getPaymentSucessStatus => _isPaymentSuccessful;

  // Setters
  WithdrawStatusProvider(
      bool isPaymentComplete, bool isDoingPayment, bool isPaymentSuccessful)
      : super() {
    _isPaymentComplete = isPaymentComplete;
    _isDoingPayment = isDoingPayment;
    _isPaymentSuccessful = isPaymentSuccessful;
  }

  void setDoingPayment(bool setter) {
    _isDoingPayment = setter;
    notifyListeners();
  }

  void setPaymentComplete(bool setter) {
    _isPaymentComplete = setter;
    notifyListeners();
  }

  void setPaymentSuccessful(bool setter) {
    _isPaymentSuccessful = setter;
    notifyListeners();
  }
}
