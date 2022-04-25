import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/root_component.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend/constants/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Future _getUserDetailsFromAPI = Future<String>.delayed(
      const Duration(seconds: 2),
      () {
        // Setting the user values temporarily according to the firebase user values
        // Do API calls here
        context.read<UserProvider>().setUserFromUserObject(testUser);
        // TestUser haven't verified kyc
        context.read<UserStatusProvider>().setKYC(false);
        // TestUser haven't verified bank details
        context.read<UserStatusProvider>().setBankDetails(false);
        // The user is not depositing money
        context.read<UserStatusProvider>().setDepositingMoney(false);
        return "Data Loaded";
      },
    );

    return FutureBuilder(
      future: _getUserDetailsFromAPI,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return const RootComponent();
        } else if (snapshot.hasError) {
          return const ErrorComponent();
        } else {
          return const LoadingComponent();
        }
      },
    );
  }
}

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Some error occurred"),
        ),
      ),
    );
  }
}
