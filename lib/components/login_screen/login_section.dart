import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/auth_utils.dart';
import 'package:frontend/utils/verify_input.dart';

import '../../models/otf_verification_model.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// Login Section is the outer wrapper of all the text widgets, textfields and buttons
class LoginSection extends StatefulWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {

  bool usingEmail = true;
  bool _isSigningIn = false;
  String emailOrPhone = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailOrPhoneController = TextEditingController();

  void signIn() async
  {
    String? status;
    setState(() {
      _isSigningIn = true;
    });

    status = await Auth(authInstance: auth).signInWithEmail(emailOrPhone, password);

    setState(() {
      _isSigningIn = false;
    });

    if(status == "Success") {
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error : ${status ?? "Something went wrong"}')));
    }
  }

  void signInWithPhone() async {
    print("sign in with phone called with phone: $emailOrPhone");
    setState(() {
      _isSigningIn = true;
    });
    await Auth(authInstance: auth).verifyPhoneNumber(
      emailOrPhone,
          () {
        print("Inside onVerificationComplete");
      },
          (id, resendToken) {
        print("Inside onCodeSent $id");
        setState(() {
          _isSigningIn = false;
        });
        Navigator.pushNamed(
          context,
          '/otpverify',
          arguments: OTPModel(
            resendToken: resendToken,
            phoneNumber: emailOrPhone,
            verificationId: id,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      // This will make the sizedBox extend upto 100% of screen width and height
      height:double.infinity,
      width:double.infinity,

      child:Column(
        children: [
          Row(
            children: [
              GestureDetector(
                // Go back
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:15.0,left: 20.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                        semanticLabel: 'Go back',
                      ),
                      SizedBox(
                        width:12,
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
                  "LogIn",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,10.0,30.0,5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15,8,15,2),
                          child: Text(
                            "EMAIL/MOBILE NUMBER",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child:
                          (usingEmail)?
                              TextField(
                                controller: emailOrPhoneController,
                                key: const Key('email'),
                                autofocus: true,
                                toolbarOptions: const ToolbarOptions(
                                  paste: true,
                                ),
                                onChanged: (text){
                                  emailOrPhone = text;
                                  setState(() {
                                    // print(isUsingEmail(text));
                                    usingEmail = isUsingEmail(text);
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'abc@example.com',
                                ),
                              ):
                              IntlPhoneField(
                                initialCountryCode: 'IN',
                                controller: emailOrPhoneController,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                    emailOrPhone = phone.completeNumber;
                                    setState(() {
                                      usingEmail = isUsingEmail(emailOrPhone);
                                    });
                                    print(usingEmail);
                                },
                                onCountryChanged: (country) {
                                  print('Country changed to: ' + country.name);
                                },
                              ),
                        ),
                        if(usingEmail)
                          Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15,8,15,2),
                              child: Text(
                                "PASSWORD",
                                style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                                ),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextField(
                                key: const Key('password'),
                                onChanged: (text){
                                  password = text;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: '************',
                                ),
                              ),
                            ),
                          ],
                        ),
                        (!_isSigningIn)?GestureDetector(
                          key: const Key('continue_test'),
                          onTap: (){
                            if (usingEmail) {
                              signIn();
                            }
                            else{
                              //signin with phone number here
                              signInWithPhone();
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                              color: Color(0xff554099),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15.0,8.0,15.0,8.0),
                                  child: Text('Continue',style: TextStyle(fontSize: 20, color: Colors.white),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ):Container(
                          color: const Color(0xff554099),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
