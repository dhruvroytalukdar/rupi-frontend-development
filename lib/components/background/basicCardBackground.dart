import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/components/home_screen/bank_card_component/bank_details_component.dart';

class CardBackground extends StatefulWidget {

  final Widget contentWidget;
  bool renderWidget; //renders a widget (true by default)
  double? setComponentHeightRatio;
  CardBackground({Key? key, required this.contentWidget, this.setComponentHeightRatio,required this.renderWidget})
      : super(key: key);
  @override
  State<CardBackground> createState() => _CardBackgroundState();
}

class _CardBackgroundState extends State<CardBackground> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.cloudyKnoxville,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(75, 74, 74, 74),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Card(
          color: Colors.white70,
          // color: Colors.transparent,
          elevation: 0.1,
          child: SizedBox(
            width: double.infinity,
            height: getDeviceHeight(context) * (widget.setComponentHeightRatio ?? 0.53) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (widget.renderWidget)?Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.contentWidget,
                ],
              ):null,
            ),
        ),
    ),
    );
  }
}