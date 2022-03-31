import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/background/background_design.dart';
import 'package:frontend/components/otp_screen/content_section.dart';
import 'package:frontend/models/otf_verification_model.dart';
import 'package:frontend/utils/auth_utils.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    OTPModel otpdetails =
        ModalRoute.of(context)!.settings.arguments as OTPModel;

    print("ID ${otpdetails.verificationId}");

    Future<void> signIn(String smscode) async {
      String? status = await Auth(authInstance: auth)
          .signInWithPhoneNumber(otpdetails.verificationId, smscode);
      if (status == "Success") {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error : ${status ?? "Something went wrong"}')));
      }
    }

    Future<void> resendOTPWrapper() async {
      await Auth(authInstance: auth)
          .sendOTPAgain(otpdetails.phoneNumber, otpdetails.resendToken);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP resent successfully'),
        ),
      );
    }

    return BackgroundDesign(
      contentWidget: ContentSection(
        signIn: signIn,
        resendOTP: resendOTPWrapper,
      ),
    );
  }
}
