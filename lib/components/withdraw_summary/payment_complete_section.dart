import 'package:flutter/material.dart';
import 'package:frontend/components/withdraw_summary/failure.dart';
import 'package:frontend/components/withdraw_summary/success.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentCompleteSection extends StatefulWidget {
  final String upiId;
  final String amount;
  const PaymentCompleteSection(
      {Key? key, required this.upiId, required this.amount})
      : super(key: key);

  @override
  State<PaymentCompleteSection> createState() => _PaymentCompleteSectionState();
}

class _PaymentCompleteSectionState extends State<PaymentCompleteSection> {
  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");

  @override
  Widget build(BuildContext context) {
    final isPaymentSuccessful =
        Provider.of<WithdrawStatusProvider>(context).getPaymentSucessStatus;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: isPaymentSuccessful
            ? SuccessSection(upiId: widget.upiId, amount: widget.amount)
            : FailureSection(upiId: widget.upiId, amount: widget.amount),
      ),
    );
  }
}
