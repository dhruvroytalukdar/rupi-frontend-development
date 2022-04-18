import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class PercentageSection extends StatefulWidget {
  final String percentage;
  final bool isActive;

  const PercentageSection({
    Key? key,
    required this.percentage,
    required this.isActive,
  }) : super(key: key);

  @override
  State<PercentageSection> createState() => _PercentageSectionState();
}

class _PercentageSectionState extends State<PercentageSection> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: getDeviceWidth(context) * 0.18,
        color: widget.isActive
            ? AppColors.homeScreenUpperBackground
            : Colors.blueGrey[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            widget.percentage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.isActive ? Colors.white : Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
