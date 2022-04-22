import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:frontend/constants/index.dart';

class BackgroundDesignV2 extends StatefulWidget {
  final Widget contentWidget;

  const BackgroundDesignV2({Key? key, required this.contentWidget})
      : super(key: key);

  @override
  State<BackgroundDesignV2> createState() => _BackgroundDesignV2State();
}

class _BackgroundDesignV2State extends State<BackgroundDesignV2> {
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
        body: SafeArea(
          child: Container(
            height:double.infinity,
            width:double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: GradientColors.shadyWater,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: widget.contentWidget,
          ),
        ),
      ),
    );
  }
}
