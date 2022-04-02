import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getDeviceHeight(context) * 0.25,
      child: Column(
        children: [
          Text("Transaction 1"),
          Text("Transaction 2"),
          Text("Transaction 3"),
          Text("Transaction 4"),
        ],
      ),
    );
  }
}
