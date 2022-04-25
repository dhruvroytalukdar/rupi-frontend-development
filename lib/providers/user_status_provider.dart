import 'package:flutter/material.dart';

class UserStatusProvider extends ChangeNotifier {
  bool _isKYCDone = false;
  bool _isBankDetailsUpdated = false;
  bool _isDepositingMoney = false;
  bool _showCrypto = false;
  bool? _useHolding;

  // Getters
  bool get getKYCStatus => _isKYCDone;
  bool get getBankDetailsStatus => _isBankDetailsUpdated;
  bool get getIfDepositingMoney => _isDepositingMoney;
  bool get getIfShowingCrypto => _showCrypto;
  bool? get getHoldingStatus => _useHolding;

  // Setters
  UserStatusProvider(bool kycStatus, bool bankDetailsStatus, bool depositMoney,
      bool showCrypto)
      : super() {
    _isKYCDone = kycStatus;
    _isBankDetailsUpdated = bankDetailsStatus;
    _isDepositingMoney = depositMoney;
    _showCrypto = showCrypto;
  }

  void toggleDepositingMoney() {
    _isDepositingMoney = !_isDepositingMoney;
    notifyListeners();
  }

  void toggleShowCrypto() {
    _showCrypto = !_showCrypto;
    notifyListeners();
  }

  void setHoldingStatus(bool? setter) {
    _useHolding = setter;
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

  void kycDone() {
    _isKYCDone = !_isKYCDone;
    notifyListeners();
  }

  void bankDetailsUpdated() {
    _isBankDetailsUpdated = !_isBankDetailsUpdated;
    notifyListeners();
  }
}
