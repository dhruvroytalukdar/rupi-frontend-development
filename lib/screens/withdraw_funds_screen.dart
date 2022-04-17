import 'package:flutter/material.dart';

class WithDrawFundsScreen extends StatelessWidget {
  const WithDrawFundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: const [
          Text("Withdraw Funds screen"),
        ],
      ),
    );
  }
}
