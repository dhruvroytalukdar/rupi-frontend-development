import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/utils/auth_utils.dart';
import 'package:provider/provider.dart';
import '../constants/index.dart';

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
      (){
        // Setting the user values temporarily according to the firebase user values
        // Do API calls here
        context.read<UserProvider>().setUserFromUserPassword(auth.currentUser?.email ?? "", auth.currentUser?.displayName ?? "", auth.currentUser?.phoneNumber ?? "");
        return "Data Loaded";
      },
    );

    return FutureBuilder(
      future: _getUserDetailsFromAPI,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData) {
          return const RootComponent();
        } else if(snapshot.hasError) {
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


class RootComponent extends StatelessWidget {
  const RootComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.uiStatusBarColor,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child:Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                context.watch<UserProvider>().isUserLoggedIn ? Text("Home ${context.watch<UserProvider>().loggedInUser?.fullName}") : const Text("You are logged out"),
                ElevatedButton(onPressed: () async {
                  await Auth(authInstance: auth).logoutUser();
                  context.read<UserProvider>().resetUser();
                  Navigator.pushReplacementNamed(context, '/welcome');
                }, child: const Text('Logout')),
              ],
            )
        ),
      ),
    );
  }
}
