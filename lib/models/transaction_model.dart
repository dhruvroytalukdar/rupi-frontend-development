class TransactionModel {
  // Message describing the type of transaction
  String message;
  // Amount of the transaction
  double amount;
  // date-time of transaction
  DateTime dateTime;

  TransactionModel(
      {required this.message, required this.amount, required this.dateTime});
}
