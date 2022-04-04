import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_list.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  key: const Key("transaction_filter_button"),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt_sharp,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const TransactionList(),
        ],
      ),
    );
  }
}
