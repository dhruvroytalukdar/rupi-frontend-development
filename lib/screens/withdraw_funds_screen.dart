import 'package:flutter/material.dart';
import 'package:frontend/components/withdrawfunds_screen/content_section.dart';
import 'package:frontend/constants/index.dart';

class WithDrawFundsScreen extends StatelessWidget {
  const WithDrawFundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.homeScreenUpperBackground,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: const ContentSection(),
    );
  }
}
