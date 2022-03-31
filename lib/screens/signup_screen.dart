import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/signup_screen/signup_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundDesign(
      contentWidget: SignupSection(),
    );
  }
}
