import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

// OTPSection is the outer wrapper of all the text widgets, textfields and buttons
class ContentSection extends StatefulWidget {
  final Function signIn;
  final Function resendOTP;

  const ContentSection(
      {Key? key, required this.signIn, required this.resendOTP})
      : super(key: key);

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  bool _isSigningIn = false;
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  OtpFieldController otpController = OtpFieldController();
  String smsCode = "";

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
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
                  const SizedBox(
                    height: 20,
                  ),
                  OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width * (4 / 5),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 8,
                    otpFieldStyle: OtpFieldStyle(
                      focusBorderColor: Colors.orange,
                      backgroundColor: Colors.white,
                    ),
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                    onCompleted: (pin) {
                      smsCode = pin;
                    },
                    onChanged: (pin) {
                      print(pin);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Did not recieve your OTP?",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await widget.resendOTP();
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    key: const Key('otpcontinuebutton'),
                    onTap: () async {
                      if (smsCode != "") {
                        await widget.signIn(smsCode);
                        otpController.clear();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff554099),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 12.0),
                            child: Text(
                              'Continue',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28.0,
                              semanticLabel: 'Continue icon',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
