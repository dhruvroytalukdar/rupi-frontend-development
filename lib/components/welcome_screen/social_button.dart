import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// A single widget that implements the social login button
class SocialButton extends StatefulWidget {

  // Class Attributes
  final String text;
  final String iconAddr;
  final Color primaryColor;
  final Color textColor;
  final Key button_key;
  final Future<UserCredential> Function() login_function;


  const SocialButton({Key? key,required this.login_function,required this.button_key,required this.text,required this.iconAddr,required this.primaryColor,required this.textColor}) : super(key:key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {

  bool _isSigningIn = false;

  void socialAuth() async {
    UserCredential cred;
    try {
      setState(() {
        _isSigningIn = true;
      });
      cred = await widget.login_function();
      setState(() {
        _isSigningIn = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    }on FirebaseAuthException catch (e) {
      setState(() {
        _isSigningIn = false;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }catch (e){
      setState(() {
        _isSigningIn = false;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_isSigningIn ? SizedBox(
      width:double.infinity,
      height:40,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: ElevatedButton.icon(
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
      ),
    ):const SizedBox(width:40,height:40,child:CircularProgressIndicator(color: Colors.white,));
  }
}
