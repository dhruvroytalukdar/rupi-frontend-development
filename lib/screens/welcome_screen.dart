import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/welcome_screen/content_section.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundDesign(
      contentWidget: ContentSection(),
    );
  }
}
