import 'package:flutter/material.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

List<TransactionModel> list = [
  TransactionModel(
    message: "Deposit",
    amount: 500,
    dateTime: DateTime.utc(2021, 1, 30),
  ),
  TransactionModel(
    message: "Deposit",
    amount: 200,
    dateTime: DateTime.utc(2021, 1, 30),
  ),
  TransactionModel(
    message: "Withdraw",
    amount: 600,
    dateTime: DateTime.utc(2021, 1, 30),
  ),
  TransactionModel(
    message: "Transfer",
    amount: 550,
    dateTime: DateTime.utc(2022, 2, 19),
  ),
  TransactionModel(
    message: "Interest",
    amount: 20.36,
    dateTime: DateTime.utc(2022, 2, 19),
  ),
];

User testUser = User(
  email: "dhruvroy8@gmail.com",
  fullName: "Dhruv Roy Talukdar",
  phoneNumber: "+91 9876543210",
  currentBalance: 6000,
  investedAmount: 4000,
  totalReturns: 2000,
  panNumber: "ABQPT12348",
  transactionList: list,
);

class AppColors {
  static const Color outerCircleTopGradient = Color(0x702c37bf);
  static const Color outerCircleDownGradient = Color(0x70d35e2a);

  static const Color innerCircleTopGradient = Color(0xff2c37bf);
  static const Color innerCircleDownGradient = Color(0xffd35e2a);

  static const Color uiStatusBarColor = Color(0xff68458b);
  static const Color intermediateStatusBarColor1 = Colors.blueAccent;
  static const Color intermediateStatusBarColor2 = Colors.deepPurpleAccent;
  static List<Color> intermediateStatusBarColors = [
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.indigo,
  ];

  static const Color homeScreenUpperBackground = Color(0xff1bb55c);
}

class AppConstants {
  static const double minDeviceHeight = 590;
  static const double maxDeviceHeight = 830;

  static const double minYForInnerCircle = -485;
  static const double maxYForInnerCircle = -335;

  static const double minYForOuterCircle = -492;
  static const double maxYForOuterCircle = -345;

  static double interpolateValue(String whichCircle, double height) {
    double heightDiff = maxDeviceHeight - minDeviceHeight;
    double yDiff = 0;
    if (whichCircle == "inner") {
      yDiff = maxYForInnerCircle - minYForInnerCircle;
      return minYForInnerCircle +
          yDiff * (height - minDeviceHeight) / heightDiff;
    }
    yDiff = maxYForOuterCircle - minYForOuterCircle;
    return minYForOuterCircle + yDiff * (height - minDeviceHeight) / heightDiff;
  }
}
