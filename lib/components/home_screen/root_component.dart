import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

class RootComponent extends StatelessWidget {
  const RootComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "${Provider.of<UserProvider>(context).loggedInUser!.currentBalance}",
              key: const Key("user_current_value"),
            ),
          ],
        ),
      ),
    );
  }
}
