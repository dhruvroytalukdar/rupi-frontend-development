import 'package:flutter/material.dart';
import 'package:frontend/components/withdrawfunds_screen/analytics_section.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum AmountPrecentage { percent25, percent50, percent75, percent100 }

class ContentSection extends StatefulWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
  AmountPrecentage _currPercentage = AmountPrecentage.percent25;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 18.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Withdraw from Lazer",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "Current Balance",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              formatCurrency.format(
                Provider.of<UserProvider>(context).loggedInUser!.currentBalance,
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const AnalyticSection(),
            const SizedBox(height: 20.0),
            const TextField(
              key: Key('withdrawfund_field'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.homeScreenUpperBackground,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.homeScreenUpperBackground,
                    width: 1.0,
                  ),
                ),
                hintText: '3000',
                labelText: 'Amount to withdraw',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.homeScreenUpperBackground,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.18,
                      color: AppColors.homeScreenUpperBackground,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "25%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: getDeviceWidth(context) * 0.18,
                      color: AppColors.homeScreenUpperBackground,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "50%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: getDeviceWidth(context) * 0.18,
                      color: AppColors.homeScreenUpperBackground,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "75%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: getDeviceWidth(context) * 0.18,
                      color: AppColors.homeScreenUpperBackground,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "100%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
