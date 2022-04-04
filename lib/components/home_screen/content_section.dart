import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/bank_details_component.dart';
import 'package:frontend/components/home_screen/current_value_section.dart';
import 'package:frontend/components/home_screen/holding_transaction_wrapper.dart';
import 'package:frontend/constants/index.dart';
import 'kyc_component.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getDeviceHeight(context) * 0.21,
            child: const CurrentValueSection(),
          ),
          // const HoldingTransactionWrapper(),
          const KYC_Component(),
          // const BankDetailsComponent(),
        ],
      ),
    );
  }
}
