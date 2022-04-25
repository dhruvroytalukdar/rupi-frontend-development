import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/utils/cryptoAPI.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HoldingSection extends StatefulWidget {
  const HoldingSection({Key? key}) : super(key: key);

  @override
  State<HoldingSection> createState() => _HoldingSectionState();
}

class _HoldingSectionState extends State<HoldingSection> {
  String convertToCrypto(double? amount) {
    return (amount! / getINRtoUST()).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
    bool useCrypto =
        Provider.of<UserStatusProvider>(context).getHoldingStatus ??
            Provider.of<UserStatusProvider>(context).getIfShowingCrypto;
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
                height: getDeviceHeight(context) * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Provider.of<UserStatusProvider>(context,
                                        listen: false)
                                    .setHoldingStatus(false);
                              });
                            },
                            child: Container(
                              color: (useCrypto == false)
                                  ? Colors.greenAccent[200]
                                  : Colors.greenAccent[100],
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Fiat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Provider.of<UserStatusProvider>(context,
                                        listen: false)
                                    .setHoldingStatus(true);
                              });
                            },
                            child: Container(
                              color: (useCrypto == true)
                                  ? Colors.greenAccent[200]
                                  : Colors.greenAccent[100],
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Crypto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Invested Amount",
                                style: TextStyle(
                                  fontSize: 15.5,
                                ),
                              ),
                              Text(
                                "as of ${DateFormat.yMMMMd('en_US').format(DateTime.now())}",
                                textAlign: TextAlign.right,
                                key: const Key("current_date"),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            !useCrypto
                                ? formatCurrency.format(
                                    Provider.of<UserProvider>(context)
                                        .loggedInUser!
                                        .investedAmount,
                                  )
                                : "${convertToCrypto(
                                    Provider.of<UserProvider>(context)
                                        .loggedInUser!
                                        .investedAmount,
                                  )} UST",
                            key: const Key("user_invested_money"),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          !useCrypto
                              ? formatCurrency.format(
                                  Provider.of<UserProvider>(context)
                                      .loggedInUser!
                                      .totalReturns,
                                )
                              : "${convertToCrypto(
                                  Provider.of<UserProvider>(context)
                                      .loggedInUser!
                                      .totalReturns,
                                )} UST",
                          key: const Key("user_total_returns"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.red[400],
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: Text("")),
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
