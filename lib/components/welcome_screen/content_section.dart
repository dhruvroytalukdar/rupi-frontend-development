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
        children: [
          const Text(
            "Welcome",
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
            ),
          ),
          const SizedBox(height:12),
          const Text(
            "Login to proceed",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height:45),
          const SocialButton(text: "Login with Facebook", iconAddr: "assets/icons/facebook.png", primaryColor: Color(0xff3b5998), textColor: Colors.white),
          const SizedBox(height:20),
          const SocialButton(text: "Login with Google", iconAddr: "assets/icons/google.jpg", primaryColor: Colors.white, textColor: Colors.black),
          const SizedBox(height:20),
          OutlinedButton(
            key: const Key("email_password_button"),
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Login using email/phone number",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 14.5,
                  ),
                ),
              ),
          ),
          const SizedBox(height:25),
          const Text("Don't have an account?",
            style: TextStyle(
              color:Colors.white,
              fontSize: 17,
            ),
          ),
          TextButton(
            child: const Text("Create Account",
              style: TextStyle(
                color:Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () { },
          ),
        ],
      ),
    );
  }
}
