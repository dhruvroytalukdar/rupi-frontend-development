import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/holding_component/holding_section.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_section.dart';

class HoldingTransactionWrapper extends StatelessWidget {
  const HoldingTransactionWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        HoldingSection(),
        TransactionSection(),
      ],
    );
  }
}
