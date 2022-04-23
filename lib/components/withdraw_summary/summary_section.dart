import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SummarySection extends StatefulWidget {
  final String upiId;
  final String amount;
  const SummarySection({Key? key, required this.upiId, required this.amount})
      : super(key: key);

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");

  doPayment(BuildContext context) {
    // Do api calls to do payment

    // set the app state
    Provider.of<WithdrawStatusProvider>(context, listen: false)
        .setDoingPayment(false);
    Provider.of<WithdrawStatusProvider>(context, listen: false)
        .setPaymentComplete(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Withdraw Summary",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: double.infinity,
            color: Colors.greenAccent[100],
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    formatCurrency.format(
                      double.parse(widget.amount),
                    ),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Text(
                    "UPI ID",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.upiId,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Expanded(child: Text("")),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "❌ Cancel",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.red[100],
                  side: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<WithdrawStatusProvider>(context, listen: false)
                      .setDoingPayment(true);
                  Provider.of<WithdrawStatusProvider>(context, listen: false)
                      .setPaymentComplete(false);
                  doPayment(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "✔️ Confirm",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.greenAccent[100],
                  side: const BorderSide(
                    width: 2,
                    color: AppColors.homeScreenUpperBackground,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
