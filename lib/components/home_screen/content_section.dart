import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/current_value_section.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CurrentValueSection(),
      ],
    );
  }
}
