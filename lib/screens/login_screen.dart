import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/login_screen/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundDesign(
      contentWidget: LoginSection(),
    );
  }
}
