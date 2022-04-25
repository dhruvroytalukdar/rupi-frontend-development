import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_item.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  Map<DateTime, List<TransactionModel>> convertToMap(
      List<TransactionModel> list) {
    Map<DateTime, List<TransactionModel>> res =
        <DateTime, List<TransactionModel>>{};
    for (TransactionModel data in list) {
      if (res.containsKey(data.dateTime)) {
        res[data.dateTime]?.add(data);
      } else {
        res[data.dateTime] = [data];
      }
    }
    return res;
  }

  Widget getListOfWidget(
      List<TransactionModel> transactionList, DateTime time) {
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

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactionData =
        Provider.of<UserProvider>(context).loggedInUser!.transactionList;

    transactionData.sort((a, b) {
      return b.dateTime.compareTo(a.dateTime);
    });

    Map<DateTime, List<TransactionModel>> formattedList =
        convertToMap(transactionData.take(5).toList());

    return SizedBox(
      height: getDeviceHeight(context) * 0.22,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              if (transactionData.isNotEmpty)
                for (DateTime currentDate in formattedList.keys)
                  getListOfWidget(formattedList[currentDate]!, currentDate)
            ],
          ),
        ),
      ),
    );
  }
}
