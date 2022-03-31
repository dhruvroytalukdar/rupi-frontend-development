import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/create_account_screen/content_section.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundDesign(
      contentWidget: ContentSection(),
    );
  }
}
