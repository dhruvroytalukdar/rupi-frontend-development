class KYCService {
  static Future<String> verifyPAN() async {
    String userNameAsPerPAN = "King Arthur";
    await Future.delayed(const Duration(seconds: 3));
    return userNameAsPerPAN;
  }
}