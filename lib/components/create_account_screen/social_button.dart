import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/auth_utils.dart';

// A single widget that implements the social login button
class SocialButton extends StatefulWidget {

  // Class Attributes
  final String text;
  final String iconAddr;
  final Color primaryColor;
  final Color textColor;
  final Key button_key;
  final String login_provider;


  const SocialButton({Key? key,required this.login_provider,required this.button_key,required this.text,required this.iconAddr,required this.primaryColor,required this.textColor}) : super(key:key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {

  bool _isSigningIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void socialAuth() async {
    String? status;
    setState(() {
      _isSigningIn = true;
    });
    if(widget.login_provider == "google") {
      status = await Auth(authInstance: auth).signInWithGoogle();
    }else if(widget.login_provider == "facebook") {
      status = await Auth(authInstance: auth).signInWithFacebook();
    }

    setState(() {
      _isSigningIn = false;
    });

    if(status == "Success") {
      if(auth.currentUser?.emailVerified == true) {
        //print("In home screen ${auth.currentUser?.emailVerified}");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/verify');
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status ?? "Something went wrong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_isSigningIn ? SizedBox(
      width:double.infinity,
      height:40,
      child:ElevatedButton.icon(
        key: widget.button_key,
        label:Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Text(widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 14.5,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: widget.primaryColor,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        icon: Image(
          image: AssetImage(widget.iconAddr),
          width: 25,
          height: 25,
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
        ),
        onPressed: () {
          socialAuth();
        },
      ),
    ):const SizedBox(width:40,height:40,child:CircularProgressIndicator(color: Colors.white,));
  }
}
