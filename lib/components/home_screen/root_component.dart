import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/auth_utils.dart';

class RootComponent extends StatelessWidget {
  const RootComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "${Provider.of<UserProvider>(context).loggedInUser!.currentBalance}",
              key: const Key("user_current_value"),
            ),
            ElevatedButton(
                onPressed: () async {
                        await Auth(authInstance: auth).logoutUser();
                        Navigator.pushReplacementNamed(context, '/welcome');
                      },
                child: const Text('Logout')
            )
          ],
        ),
      ),
    );
  }
}
