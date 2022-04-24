import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:frontend/constants/index.dart';

class BackgroundDesignV2 extends StatefulWidget {
  final Widget contentWidget;
  List<Color>? gradient;

  BackgroundDesignV2({Key? key, required this.contentWidget, this.gradient})
      : super(key: key);

  @override
  State<BackgroundDesignV2> createState() => _BackgroundDesignV2State();
}

class _BackgroundDesignV2State extends State<BackgroundDesignV2> {
  var grad = GradientColors.shadyWater;
  @override
  Widget build(BuildContext context) {
    grad = widget.gradient!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.intermediateStatusBarColors[1],
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
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: grad,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(7),
            ),
            child: widget.contentWidget,
          ),
        ),
      ),
    );
  }
}
