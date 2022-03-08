import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/welcome_screen/social_button.dart';
import 'package:frontend/utils/login_utils.dart';

// Content Section is the outer wrapper of all the text widgets and buttons
class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  void changeScreen(BuildContext context,String routeName){
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    return SizedBox(

      // This will make the sizedBox extend upto 100% of screen width and height
      height:double.infinity,
      width:double.infinity,

      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
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
            const SocialButton(login_provider: "facebook",button_key:Key("facebook_login_button"),text: "Login with Facebook", iconAddr: "assets/icons/facebook.png", primaryColor: Color(0xff3b5998), textColor: Colors.white),
            const SizedBox(height:20),
            const SocialButton(login_provider: "google",button_key:Key("google_login_button"),text: "Login with Google", iconAddr: "assets/icons/google.jpg", primaryColor: Colors.white, textColor: Colors.black),
            const SizedBox(height:20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                key: const Key("email_password_button"),
                onPressed: (){
                  changeScreen(context, '/login');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text("Login using Email",
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
              key:const Key("create_account_button"),
              child: const Text("Create Account",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                changeScreen(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
