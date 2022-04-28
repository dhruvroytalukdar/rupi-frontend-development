import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/utils/transaction_list_utils.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatefulWidget {
  final List<String> selectedList;
  const TransactionList({Key? key, required this.selectedList})
      : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactionData =
        Provider.of<UserProvider>(context).loggedInUser!.transactionList;

    transactionData.sort((a, b) {
      return b.dateTime.compareTo(a.dateTime);
    });

    Map<DateTime, List<TransactionModel>> formattedList =
        convertToMap(transactionData.take(5).toList(), widget.selectedList);

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
