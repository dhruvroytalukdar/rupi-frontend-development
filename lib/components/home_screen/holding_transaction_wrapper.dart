import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/holding_section.dart';
import 'package:frontend/components/home_screen/kyc_component.dart';
import 'package:frontend/components/home_screen/transaction_section.dart';

class HoldingTransactionWrapper extends StatelessWidget {
  const HoldingTransactionWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoldingSection(),
        // TransactionSection(),
        KYC_Component(),
      ],
    );
  }
}
