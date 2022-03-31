import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/verify_screen/content_section.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  void dispose() {
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
    if (user?.emailVerified == true) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  Future<void> logoutAndDeleteUser() async {
    await user?.delete();
    await auth.signOut();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundDesign(
      contentWidget: ContentSection(
        logoutAndDeleteUser: logoutAndDeleteUser,
        timer: timer,
        auth: auth,
      ),
    );
  }
}
