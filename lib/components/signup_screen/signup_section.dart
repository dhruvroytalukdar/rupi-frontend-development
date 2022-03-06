import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/login_utils.dart';

// Signup Section is the outer wrapper of all the text widgets, textfields and buttons
class SignupSection extends StatefulWidget {
  const SignupSection({Key? key}) : super(key: key);

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {

  bool _isSigningUp = false;
  String email = "";
  String password = "";

  void signUp() async{
    //signup code goes here
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
                  padding: const EdgeInsets.only(top:30.0,left: 20.0),
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 26.0,
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
                      children:  [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15,8,15,2),
                          child: Text(
                            "FULL NAME",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            key: const Key('full_name'),
                            onChanged: (text){
                              // email = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: 'John Doe',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15,8,15,2),
                          child: Text(
                            "EMAIL",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            key: const Key('email'),
                            onChanged: (text){
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'abc@example.com',
                            ),
                          ),
                        ),
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15,8,15,2),
                          child: Text(
                            "CONFIRM PASSWORD",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            key: const Key('confirm_password'),
                            onChanged: (text){
                              // password = text;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: '************',
                            ),
                          ),
                        ),

                        (!_isSigningUp)?GestureDetector(
                          key: const Key('getStarted_test'),
                          onTap: (){
                            signUp();
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
                                  child: Text('Get Started',style: TextStyle(fontSize: 20, color: Colors.white),),
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
                        ):const CircularProgressIndicator(),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,80,0,0),
                  child: GestureDetector(
                    key: const Key('terms_conditions_test'),
                    onTap: (){
                      //link to terms and conditions
                    },
                    child: Text(
                      'By proceeding, you agree with our Terms & Conditions',
                      style: TextStyle(
                          backgroundColor: Colors.white.withOpacity(0.0),
                          color: Colors.indigo,
                          fontSize: 14),
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
