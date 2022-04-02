import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/transaction_list.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Transactions",
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TransactionList(),
        ],
      ),
    );
  }
}
