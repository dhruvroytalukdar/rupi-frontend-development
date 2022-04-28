import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_list.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  List<String> _selectedValues = [];
  final List<String> _values = ["Withdraw", "Transfer", "Deposit", "Interest"];

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<String>(
          items: _values.map((e) => MultiSelectItem<String>(e, e)).toList(),
          initialValue: _selectedValues,
          title: const Text("Show Only (default: All)"),
          onConfirm: (values) {
            if (values.length == _values.length) values = [];
            setState(() {
              _selectedValues = values;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  onPressed: () {
                    _showMultiSelect(context);
                  },
                  icon: const Icon(
                    Icons.filter_alt_sharp,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          TransactionList(selectedList: _selectedValues),
        ],
      ),
    );
  }
}
