import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {

  final String text;
  final String iconAddr;
  final Color primaryColor;
  final Color textColor;

  const SocialButton({Key? key,required this.text,required this.iconAddr,required this.primaryColor,required this.textColor}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:40,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: ElevatedButton.icon(
          label:Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Text(text,
              style: TextStyle(
                color: textColor,
                fontSize: 14.5,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: primaryColor,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          icon: Image(
            image: AssetImage(iconAddr),
            width: 25,
            height: 25,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          onPressed: () {  },
        ),
      ),
    );
  }
}
