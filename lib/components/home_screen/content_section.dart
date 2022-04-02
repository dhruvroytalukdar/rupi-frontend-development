import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/current_value_section.dart';
import 'package:frontend/components/home_screen/holding_transaction_wrapper.dart';
import 'package:frontend/constants/index.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: getDeviceHeight(context) * 0.19,
          child: const CurrentValueSection(),
        ),
        const HoldingTransactionWrapper(),
      ],
    );
  }
}
