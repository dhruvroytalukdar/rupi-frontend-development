import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/login_screen/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff68458b),
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),

      child: Scaffold(
        body:SafeArea(
          // The Column and Expanded widget are making the stack to expand the entire screen height
          child:Column(
            children: [
              Expanded(
                flex:1,
                child: Stack(
                  children: [

                    //The outer circle
                    Positioned(
                      left:-190,
                      top:-400,
                      child: Container(
                        width:1140.32,
                        height:1050,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [
                                Color(0x702c37bf),
                                Color(0x70d35e2a),
                              ]),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    //The inner circle
                    Positioned(
                      left:-175,
                      top:-390,
                      child: Container(
                        width:963.32,
                        height:1016,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [
                                Color(0xff2c37bf),
                                Color(0xffd35e2a),
                              ]),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                     const LoginSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}