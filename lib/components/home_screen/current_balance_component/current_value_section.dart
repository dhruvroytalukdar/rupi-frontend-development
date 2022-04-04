import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentValueSection extends StatelessWidget {
  const CurrentValueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // To format currency
    final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "");

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
            const Image(
              image: AssetImage("assets/icons/rupeeicon.png"),
              width: 48,
              height: 48,
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            ),
            Text(
              formatCurrency.format(Provider.of<UserProvider>(context)
                  .loggedInUser!
                  .currentBalance),
              key: const Key("user_current_value"),
              style: const TextStyle(
                fontSize: 36.0,
                color: Colors.white,
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
