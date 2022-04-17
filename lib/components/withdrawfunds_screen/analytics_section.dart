import 'package:flutter/material.dart';

class AnalyticSection extends StatelessWidget {
  const AnalyticSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Your average USDT buying price is ₹78.90",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 7.0),
          Text(
            "Current withdrawl price of USDT is ₹79.0",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 7.0),
          Text(
            "Fees is ₹0.0",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
