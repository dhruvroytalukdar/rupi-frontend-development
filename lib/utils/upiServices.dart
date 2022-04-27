class UPIService {

  //A basic placeholder regex to check if a UPI ID is valid or not
  //Will be replaced by an API Call to verify existence of UPI
  static bool verifyUPI(String upi) {
    final upiRegEx = RegExp('[a-zA-Z0-9\\.\\-]{2,256}\\@[a-zA-Z][a-zA-Z]{2,64}');
    bool upiExists = upiRegEx.hasMatch(upi);
    Future.delayed(const Duration(seconds: 1));
    return upiExists;
  }
}