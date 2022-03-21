import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Login Section is the outer wrapper of all the text widgets, textfields and buttons
class ContentSection extends StatefulWidget {
  final Function signIn;

  const ContentSection({Key? key, required this.signIn}) : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  bool _isSigningIn = false;
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // This will make the sizedBox extend upto 100% of screen width and height
      height: double.infinity,
      width: double.infinity,

      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                // Go back
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                        semanticLabel: 'Go back',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  child: const Text("Continue"),
                  onPressed: () {
                    widget.signIn();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
