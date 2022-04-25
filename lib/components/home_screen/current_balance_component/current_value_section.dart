import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/utils/cryptoAPI.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentValueSection extends StatefulWidget {
  const CurrentValueSection({Key? key}) : super(key: key);

  @override
  State<CurrentValueSection> createState() => _CurrentValueSectionState();
}

class _CurrentValueSectionState extends State<CurrentValueSection> {
  @override
  Widget build(BuildContext context) {
    String convertToCrypto(double? amount) {
      return (amount! / getINRtoUST()).toStringAsFixed(2);
    }

    // To format currency
    final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
    bool useCrypto =
        Provider.of<UserStatusProvider>(context).getIfShowingCrypto;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Current Value",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 7.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Provider.of<UserStatusProvider>(context, listen: false)
                      .setHoldingStatus(null);
                  Provider.of<UserStatusProvider>(context, listen: false)
                      .toggleShowCrypto();
                });
              },
              child: Text(
                !useCrypto
                    ? formatCurrency.format(
                        Provider.of<UserProvider>(context)
                            .loggedInUser!
                            .currentBalance,
                      )
                    : "${convertToCrypto(
                        Provider.of<UserProvider>(context)
                            .loggedInUser!
                            .currentBalance,
                      )} UST",
                key: const Key("user_current_value"),
                style: const TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7.0),
        const Text(
          "15% APY",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
