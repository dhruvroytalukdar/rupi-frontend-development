import 'package:flutter/material.dart';

class WithdrawStatusProvider extends ChangeNotifier {
  bool _isPaymentComplete = false;
  bool _isDoingPayment = false;

  // Getters
  bool get getPaymentCompleteStatus => _isPaymentComplete;
  bool get getDoingPaymentStatus => _isDoingPayment;

  // Setters
  WithdrawStatusProvider(bool isPaymentComplete, bool isDoingPayment)
      : super() {
    _isPaymentComplete = isPaymentComplete;
    _isDoingPayment = isDoingPayment;
  }

  void setDoingPayment(bool setter) {
    _isDoingPayment = setter;
    notifyListeners();
  }

  void setPaymentComplete(bool setter) {
    _isPaymentComplete = setter;
    notifyListeners();
  }
}
