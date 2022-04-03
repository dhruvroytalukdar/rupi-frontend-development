import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HoldingSection extends StatelessWidget {
  const HoldingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Holdings",
            style: TextStyle(
              fontSize: 27.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(75, 74, 74, 74),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: getDeviceHeight(context) * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text("")),
                        Text(
                          "as of ${DateFormat.yMMMMd('en_US').format(DateTime.now())}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Invested Amount",
                              style: TextStyle(
                                fontSize: 15.5,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              formatCurrency.format(
                                Provider.of<UserProvider>(context)
                                    .loggedInUser!
                                    .investedAmount,
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Overall Returns",
                              style: TextStyle(
                                fontSize: 15.5,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              formatCurrency.format(
                                Provider.of<UserProvider>(context)
                                    .loggedInUser!
                                    .totalReturns,
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red[400],
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),
                    Text(
                      "The value of your portfolio will fluctuate based on current crypto market conditions",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.5, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
