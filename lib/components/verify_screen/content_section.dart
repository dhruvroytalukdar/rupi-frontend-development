import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContentSection extends StatefulWidget {
  final Function logoutAndDeleteUser;
  final FirebaseAuth auth;
  final Timer timer;

  const ContentSection(
      {Key? key,
      required this.logoutAndDeleteUser,
      required this.timer,
      required this.auth})
      : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "A verification email has been sent to ${widget.auth.currentUser?.email}.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  key: const Key("skip_email_verification"),
                  onPressed: () {
                    widget.timer.cancel();
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    "Skip for now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                    ),
                  ),
                ),
                OutlinedButton(
                  key: const Key("change_email_button_on_verify_screen"),
                  onPressed: () async {
                    await widget.logoutAndDeleteUser();
                    Navigator.pushReplacementNamed(context, '/create-account');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    "Change email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
