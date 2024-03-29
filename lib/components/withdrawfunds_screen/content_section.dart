import 'package:flutter/material.dart';
import 'package:frontend/components/withdrawfunds_screen/analytics_section.dart';
import 'package:frontend/components/withdrawfunds_screen/percentage_section.dart';
import 'package:frontend/components/withdrawfunds_screen/withdraw_textfield.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/withdraw_summary_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum AmountPrecentage {
  percent25,
  percent50,
  percent75,
  percent100,
  noneSelected
}

final List<String> upiIds = ["9876543210@okhdfc", "0123456789@denabank"];

class ContentSection extends StatefulWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
  AmountPrecentage _currPercentage = AmountPrecentage.noneSelected;
  final TextEditingController _controller = TextEditingController();
  String currentUPIValue = upiIds[0];

  disableTabs() {
    setState(() {
      _currPercentage = AmountPrecentage.noneSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 18.0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Title of the screen
              const Text(
                "Withdraw from Lazer",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15.0),
              // Subtitle
              Text(
                "Current Balance",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10.0),
              // Current Balance of the user.
              Text(
                formatCurrency.format(
                  Provider.of<UserProvider>(context)
                      .loggedInUser!
                      .currentBalance,
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 15.0),
              // Basic returns and withdrawl analytics
              const AnalyticSection(),
              const SizedBox(height: 20.0),
              // Textfield to take the withdraw amount.
              WithdrawTextfield(
                controller: _controller,
                disableTabs: disableTabs,
              ),
              // The Radio buttons
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        key: const Key("25%_key"),
                        onTap: () {
                          setState(() {
                            _currPercentage = AmountPrecentage.percent25;
                            _controller.text = (Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .loggedInUser!
                                        .currentBalance! *
                                    0.25)
                                .toString();
                          });
                        },
                        child: PercentageSection(
                          percentage: "25%",
                          isActive:
                              _currPercentage == AmountPrecentage.percent25,
                        ),
                      ),
                      GestureDetector(
                        key: const Key("50%_key"),
                        onTap: () {
                          setState(() {
                            _currPercentage = AmountPrecentage.percent50;
                            _controller.text = (Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .loggedInUser!
                                        .currentBalance! *
                                    0.5)
                                .toString();
                          });
                        },
                        child: PercentageSection(
                          percentage: "50%",
                          isActive:
                              _currPercentage == AmountPrecentage.percent50,
                        ),
                      ),
                      GestureDetector(
                        key: const Key("75%_key"),
                        onTap: () {
                          setState(() {
                            _currPercentage = AmountPrecentage.percent75;
                            _controller.text = (Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .loggedInUser!
                                        .currentBalance! *
                                    0.75)
                                .toString();
                          });
                        },
                        child: PercentageSection(
                          percentage: "75%",
                          isActive:
                              _currPercentage == AmountPrecentage.percent75,
                        ),
                      ),
                      GestureDetector(
                        key: const Key("100%_key"),
                        onTap: () {
                          setState(() {
                            _currPercentage = AmountPrecentage.percent100;
                            _controller.text = (Provider.of<UserProvider>(
                                        context,
                                        listen: false)
                                    .loggedInUser!
                                    .currentBalance)
                                .toString();
                          });
                        },
                        child: PercentageSection(
                          percentage: "100%",
                          isActive:
                              _currPercentage == AmountPrecentage.percent100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "Select Account",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 10.0),
              DropdownButton<String>(
                key: const Key("withdraw_upi_drop_down"),
                value: currentUPIValue,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 36,
                ),
                elevation: 16,
                style: TextStyle(color: Colors.blueGrey[700], fontSize: 20),
                onChanged: (String? newValue) {
                  setState(() {
                    currentUPIValue = newValue!;
                  });
                },
                items: upiIds.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: ElevatedButton(
                      key: const Key("withdraw_money_continue_button"),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawSummaryScreen(
                                amount: _controller.text,
                                upiId: currentUPIValue,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          "💸 Continue",
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
