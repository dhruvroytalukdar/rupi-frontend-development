import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/home_screen/content_section.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_component.dart';
import 'package:frontend/components/home_screen/dual_background.dart';
import 'package:frontend/constants/index.dart';

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
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.homeScreenUpperBackground,
            elevation: 0.0,
          ),
          endDrawer: const DrawerComponent(),
          body: Stack(
            children: const [
              BackgroundComponent(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: ContentSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
