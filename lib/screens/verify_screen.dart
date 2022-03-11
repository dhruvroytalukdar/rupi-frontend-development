import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/utils/interpolate.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/auth_utils.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  late Timer timer;
  User? user;

  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    user = auth.currentUser;
    user?.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user?.reload();
    if(user?.emailVerified == true) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  Future<void> logoutAndDeleteUser() async {
    await user?.delete();
    await auth.signOut();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double min_y_outer = -492;
    double max_y_outer = -345;
    double min_height_outer = 590;
    double max_height_outer = 830;

    double min_y_inner = -485;
    double max_y_inner = -335;
    double min_height_inner = 590;
    double max_height_inner = 830;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff68458b),
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),

      child: Scaffold(
        body:SafeArea(
          // The Column and Expanded widget are making the stack to expand the entire screen height
          child:Column(
            children: [
              Expanded(
                flex:1,
                child: Stack(
                  children: [

                    //The outer circle
                    Positioned(
                      left:-190,
                      top:interpolate_value(min_y_outer, max_y_outer, min_height_outer, max_height_outer, height),
                      child: Container(
                        width:1140.32,
                        height:1050,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [
                                Color(0x702c37bf),
                                Color(0x70d35e2a),
                              ]),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    //The inner circle
                    Positioned(
                      left:-175,
                      top:interpolate_value(min_y_inner, max_y_inner, min_height_inner, max_height_inner, height),
                      child: Container(
                        width:963.32,
                        height:1016,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [
                                Color(0xff2c37bf),
                                Color(0xffd35e2a),
                              ]),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Page Contents
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("A verification email has been sent to ${auth.currentUser?.email}.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  key: const Key("skip_email_verification"),
                                  onPressed: () {
                                    timer.cancel();
                                    Navigator.pushReplacementNamed(context, '/home');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.white),
                                    shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  child: const Text("Skip for now",
                                    style: TextStyle(
                                      color:Colors.white,
                                      fontSize: 14.5,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  key: const Key("change_email_button_on_verify_screen"),
                                  onPressed: () async {
                                    await logoutAndDeleteUser();
                                    Navigator.pushReplacementNamed(context, '/create-account');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.white),
                                    shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  child: const Text("Change email",
                                    style: TextStyle(
                                      color:Colors.white,
                                      fontSize: 14.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
