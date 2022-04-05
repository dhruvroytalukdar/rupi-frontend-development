import 'package:flutter/material.dart';

class UserStatusProvider extends ChangeNotifier {
  bool _isKYCDone = false;
  bool _isBankDetailsUpdated = false;
  bool _isAllUserDetailsUpdated = false;
  bool _isDepositingMoney = false;

  // Getters
  bool get getKYCStatus => _isKYCDone;
  bool get getBankDetailsStatus => _isBankDetailsUpdated;
  bool get getIfUserDetailsUpdated => _isAllUserDetailsUpdated;
  bool get getIfDepositingMoney => _isDepositingMoney;

  // Setters
  UserStatusProvider(bool kycStatus, bool bankDetailsStatus,
      bool allUserDetailsUpdated, bool depositMoney)
      : super() {
    _isKYCDone = kycStatus;
    _isBankDetailsUpdated = bankDetailsStatus;
    _isAllUserDetailsUpdated = allUserDetailsUpdated;
    _isDepositingMoney = depositMoney;
  }

  void toggleDepositingMoney() {
    _isDepositingMoney = !_isDepositingMoney;
    notifyListeners();
  }

  void setKYC(bool setter) {
    _isKYCDone = setter;
    notifyListeners();
  }

  void setBankDetails(bool setter) {
    _isBankDetailsUpdated = setter;
    notifyListeners();
  }

  void setDepositingMoney(bool setter) {
    _isDepositingMoney = setter;
    notifyListeners();
  }

  void setAllUserDetails(bool setter) {
    _isAllUserDetailsUpdated = setter;
    notifyListeners();
  }

  void allUserDetailsUpdated() {
    _isAllUserDetailsUpdated = true;
    notifyListeners();
  }

  void kycDone() {
    _isKYCDone = !_isKYCDone;
    notifyListeners();
  }

  void bankDetailsUpdated() {
    _isBankDetailsUpdated = !_isBankDetailsUpdated;
    notifyListeners();
  }
}
