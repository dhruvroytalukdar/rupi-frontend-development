import 'package:flutter/material.dart';
import 'package:frontend/components/withdraw_summary/payment_complete_section.dart';
import 'package:frontend/components/withdraw_summary/summary_section.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:provider/provider.dart';

class WithdrawSummaryScreen extends StatefulWidget {
  final String upiId;
  final String amount;
  const WithdrawSummaryScreen(
      {Key? key, required this.upiId, required this.amount})
      : super(key: key);

  @override
  State<WithdrawSummaryScreen> createState() => _WithdrawSummaryScreenState();
}

class _WithdrawSummaryScreenState extends State<WithdrawSummaryScreen> {
  Widget renderWidget(BuildContext context) {
    bool paymentComplete =
        Provider.of<WithdrawStatusProvider>(context).getPaymentCompleteStatus;
    bool isDoingPayment =
        Provider.of<WithdrawStatusProvider>(context).getDoingPaymentStatus;

    if (isDoingPayment) {
      return const CircularProgressIndicator(color: Colors.green);
    }
    if (!paymentComplete) {
      return SummarySection(upiId: widget.upiId, amount: widget.amount);
    }
    return PaymentCompleteSection(upiId: widget.upiId, amount: widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.homeScreenUpperBackground,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 18.0,
        ),
        child: renderWidget(context),
      ),
    );
  }
}
