import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/bank_card_component/bank_details_component.dart';
import 'package:frontend/components/home_screen/current_balance_component/current_value_section.dart';
import 'package:frontend/components/home_screen/deposit_component/deposit_component.dart';
import 'package:frontend/components/home_screen/holding_component/holding_transaction_wrapper.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';
import 'deposit_component/upiComponent.dart';
import 'kyc_component/kyc_component.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  Widget renderWidget(BuildContext context) {
    // Send the default holding transaction wrapper if not depositing money
    if (!Provider.of<UserStatusProvider>(context).getIfDepositingMoney) {
      return const HoldingTransactionWrapper();
    }

    // If KYC is not done send kyc component first
    if (!Provider.of<UserStatusProvider>(context).getKYCStatus) {
      return const KYC_Component();
    }

    // Send the deposit money component if all user details are updated and user want to deposit money
    // return const DepositMoneyComponent();
    return const UPIComponent();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getDeviceHeight(context) * 0.17,
            child: const CurrentValueSection(),
          ),

          // Do some conditional rendering here about what to show among the three screens based on the app state
          renderWidget(context),
          // const BankDetailsComponent(),
          // const KYC_Component(),
          // const UPIComponent(),
        ],
      ),
    );
  }
}
