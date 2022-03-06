import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/login_screen/login_section.dart';

import '../utils/interpolate.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double min_y_outer = -492;
    double max_y_outer = -345;
    double min_height_outer = 590;
    double max_height_outer = 830;

    double min_y_inner = -485;
    double max_y_inner = -335;
    double min_height_inner = 590;
    double max_height_inner = 830;

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
                      top:interpolate_value(min_y_outer, max_y_outer, min_height_outer, max_height_outer, height),
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
                      top:interpolate_value(min_y_inner, max_y_inner, min_height_inner, max_height_inner, height),
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