import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/components/home_screen/bank_card_component/bank_details_component.dart';

class CardBackground extends StatefulWidget {

  final Widget contentWidget;
  double? setComponentHeightRatio;
  CardBackground({Key? key, required this.contentWidget, this.setComponentHeightRatio})
      : super(key: key);
  @override
  State<CardBackground> createState() => _CardBackgroundState();
}

class _CardBackgroundState extends State<CardBackground> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(75, 74, 74, 74),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Card(
          color: Colors.amberAccent,
          elevation: 0.1,
          child: SizedBox(
            width: double.infinity,
            height: getDeviceHeight(context) * (widget.setComponentHeightRatio ?? 0.53) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.contentWidget,
                ],
              ),
            ),
        ),
    ),
    );
  }
}