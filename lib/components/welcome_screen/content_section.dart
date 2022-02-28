import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/welcome_screen/social_button.dart';

// Content Section is the outer wrapper of all the text widgets and buttons
class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      // This will make the sizedBox extend upto 100% of screen width and height
      height:double.infinity,
      width:double.infinity,

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Welcome",
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
            ),
          ),
          Text(
            "Login to proceed",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          SocialButton(text: "Login with Google", iconAddr: "assets/icons/google.jpg", primaryColor: Colors.white, textColor: Colors.black),
        ],
      ),
    );
  }
}
