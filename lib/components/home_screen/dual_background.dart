import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class BackgroundComponent extends StatelessWidget {
  const BackgroundComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: getDeviceHeight(context) / 2,
            color: AppColors.homeScreenUpperBackground,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
