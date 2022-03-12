import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/welcome_screen/content_section.dart';
import '../constants/index.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

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
                        // top:interpolate_value(min_y_outer, max_y_outer, min_height_outer, max_height_outer, height),
                        top:AppConstants.interpolateValue("outer",height),
                        child: Container(
                          width:1140.32,
                          height:1050,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [
                                AppColors.outerCircleTopGradient,
                                AppColors.outerCircleDownGradient,
                              ]),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      //The inner circle
                      Positioned(
                        left:-175,
                        // top:interpolate_value(min_y_inner, max_y_inner, min_height_inner, max_height_inner, height),
                        top:AppConstants.interpolateValue("inner",height),
                        child: Container(
                            width:963.32,
                            height:1016,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end:Alignment.bottomCenter,
                                  colors: [
                                    AppColors.innerCircleTopGradient,
                                    AppColors.innerCircleDownGradient,
                                  ]),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ),

                      const ContentSection(),
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
