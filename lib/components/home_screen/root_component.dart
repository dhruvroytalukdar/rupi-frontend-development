import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/home_screen/content_section.dart';
import 'package:frontend/components/home_screen/dual_background.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/auth_utils.dart';

class RootComponent extends StatelessWidget {
  const RootComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.homeScreenUpperBackground,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.homeScreenUpperBackground,
          elevation: 0.0,
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            children: [
              // Add a drawer header here and add functionality
              // Increase the spacing between the widgets in currentvaluesection
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: const [
              BackgroundComponent(),
              ContentSection(),
            ],
          ),
          // Column(
          //   children: [
          //     Text(
          //       "${Provider.of<UserProvider>(context).loggedInUser!.currentBalance}",
          //       key: const Key("user_current_value"),
          //     ),
          //     ElevatedButton(
          //         onPressed: () async {
          //                 await Auth(authInstance: auth).logoutUser();
          //                 Navigator.pushReplacementNamed(context, '/welcome');
          //               },
          //         child: const Text('Logout')
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
