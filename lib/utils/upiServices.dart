class UPIService {
  static bool verifyUPI(String upi) {
    final upiRegEx = RegExp('[a-zA-Z0-9\\.\\-]{2,256}\\@[a-zA-Z][a-zA-Z]{2,64}');
    bool upiExists = upiRegEx.hasMatch(upi);
    Future.delayed(const Duration(seconds: 2));
    return upiExists;
  }
}