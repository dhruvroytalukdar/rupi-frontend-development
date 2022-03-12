import 'dart:ui';

class AppColors{
  static const Color outerCircleTopGradient = Color(0x702c37bf);
  static const Color outerCircleDownGradient = Color(0x70d35e2a);

  static const Color innerCircleTopGradient = Color(0xff2c37bf);
  static const Color innerCircleDownGradient = Color(0xffd35e2a);

  static const Color uiStatusBarColor = Color(0xff68458b);
}

class AppConstants{
  static const double minDeviceHeight = 590;
  static const double maxDeviceHeight = 830;

  static const double minYForInnerCircle = -485;
  static const double maxYForInnerCircle = -335;

  static const double minYForOuterCircle = -492;
  static const double maxYForOuterCircle = -345;

  static double interpolateValue(String whichCircle,double height){
    double heightDiff = maxDeviceHeight - minDeviceHeight;
    double yDiff = 0;
    if(whichCircle == "inner") {
      yDiff = maxYForInnerCircle - minYForInnerCircle;
      return minYForInnerCircle + yDiff * (height - minDeviceHeight)/heightDiff;
    }
    yDiff = maxYForOuterCircle - minYForOuterCircle;
    return minYForOuterCircle + yDiff * (height - minDeviceHeight)/heightDiff;
  }
}