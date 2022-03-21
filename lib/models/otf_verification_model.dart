class OTPModel {
  int resendToken;
  String phoneNumber;
  String verificationId;

  OTPModel(
      {required this.resendToken,
      required this.phoneNumber,
      required this.verificationId});
}
