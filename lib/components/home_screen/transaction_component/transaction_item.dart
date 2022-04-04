import 'package:flutter/material.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transactionData;
  const TransactionItem({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transactionData.message,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            formatCurrency.format(transactionData.amount),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
