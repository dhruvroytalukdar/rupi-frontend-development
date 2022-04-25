import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FailureSection extends StatefulWidget {
  final String upiId;
  final String amount;
  const FailureSection({Key? key, required this.upiId, required this.amount})
      : super(key: key);

  @override
  State<FailureSection> createState() => _FailureSectionState();
}

class _FailureSectionState extends State<FailureSection> {
  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // This section consist of the success message and icon
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: const [
              Icon(Icons.dangerous, color: Colors.red, size: 128.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  "🙂 Failure",
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // The amount successfully withdrawn
        Text(
          "${formatCurrency.format(double.parse(widget.amount))} withdrawal",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 12.0),
        const Text(
          "Unsuccessful",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          "Incase funds deducted refund can take upto 24hrs during normal working days",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 18.0,
          ),
        ),
        // The upiId to which the amount is credited to
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Unable to credit to:",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.upiId,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),

        // button to go back to the home screen
        ElevatedButton(
          onPressed: () {
            Provider.of<WithdrawStatusProvider>(context, listen: false)
                .setPaymentComplete(false);
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 10.0,
            ),
            child: Text(
              "Go back to Home",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: AppColors.homeScreenUpperBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
      ],
    );
  }
}
