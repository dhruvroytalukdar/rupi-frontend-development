import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_designV2.dart';

class UPIDepositScreen extends StatefulWidget {
  const UPIDepositScreen({Key? key}) : super(key: key);

  @override
  State<UPIDepositScreen> createState() => _UPIDepositScreenState();
}

class _UPIDepositScreenState extends State<UPIDepositScreen> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundDesignV2(
        contentWidget: SizedBox(
          height:double.infinity,
          width:double.infinity,
          child: Text('UPI Deposit Screen'),
        )
    );
  }
}
