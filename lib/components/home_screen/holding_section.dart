import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class HoldingSection extends StatelessWidget {
  const HoldingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Holdings",
            style: TextStyle(
              fontSize: 22.0,
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
            child: SizedBox(
              width: double.infinity,
              height: getDeviceHeight(context) * 0.23,
              child: const Text("Hello"),
            ),
          ),
        ),
      ],
    );
  }
}
