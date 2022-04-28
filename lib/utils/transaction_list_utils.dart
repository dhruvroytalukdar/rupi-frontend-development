import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_item.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:intl/intl.dart';

Map<DateTime, List<TransactionModel>> convertToMap(
    List<TransactionModel> list, List<String> selectedList) {
  Map<DateTime, List<TransactionModel>> res =
      <DateTime, List<TransactionModel>>{};
  for (TransactionModel data in list) {
    if (selectedList.isEmpty ||
        (selectedList.isNotEmpty && selectedList.contains(data.message))) {
      if (res.containsKey(data.dateTime)) {
        res[data.dateTime]?.add(data);
      } else {
        res[data.dateTime] = [data];
      }
    }
  }
  return res;
}

Widget getListOfWidget(List<TransactionModel> transactionList, DateTime time) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMd('en_US').format(time),
          key: const Key("transaction_dates"),
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        for (TransactionModel data in transactionList)
          TransactionItem(transactionData: data),
      ],
    ),
  );
}
