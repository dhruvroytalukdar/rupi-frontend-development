import 'package:flutter/material.dart';

class CurrentValueSection extends StatelessWidget {
  const CurrentValueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Current Value",
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 7.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/icons/rupeeicon.png"),
              width: 48,
              height: 48,
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            ),
            Text(
              "6,000",
              style: TextStyle(
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
