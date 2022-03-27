bool isUsingEmail(String s) {
  if (s == "") {
    return true;
  }
  return double.tryParse(s) == null;
}
