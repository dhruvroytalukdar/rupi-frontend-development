import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser?.emailVerified);
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Text("Home ${auth.currentUser?.email}"),
              ElevatedButton(onPressed: () async {
                await auth.signOut();
                Navigator.pushReplacementNamed(context, '/welcome');
              }, child: const Text('Logout')),
            ],
          )
      ),
    );
  }
}
