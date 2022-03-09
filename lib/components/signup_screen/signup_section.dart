import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/auth_utils.dart';

// Signup Section is the outer wrapper of all the text widgets, textfields and buttons
class SignupSection extends StatefulWidget {
  const SignupSection({Key? key}) : super(key: key);

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {

  bool _isSigningUp = false;
  String full_name = "";
  String email = "";
  String password_text = "";
  String confirm_password_text = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage = "";
  var normalBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  );

  void signUp() async{
    //signup code goes here
    String? status;
    setState(() {
      _isSigningUp = true;
    });

    status = await Auth(authInstance: auth).signUpWithEmail(email, password_text);

    setState(() {
      _isSigningUp = false;
    });

    if(status == "Success") {
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error : ${status ?? "Something went wrong"}')));
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SizedBox(
        height: height-30,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  // Go back
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:15,left: 20.0),
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
            Column(
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
                              full_name = text;
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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            key: const Key('password'),
                            onChanged: (text){
                              password_text = text;
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
                              confirm_password_text = text;
                              if (confirm_password_text!=password_text)
                                {
                                  setState(() {
                                    errorMessage = "Both passwords must be same.";
                                    normalBorder = const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    );
                                  });
                                  // print("PASSWORD MISMATCH");
                                }
                              else
                                {
                                  setState(() {
                                    errorMessage = "";
                                    normalBorder = const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                    );
                                  });
                                }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '************',
                              errorText: errorMessage,
                              focusedErrorBorder: normalBorder,
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
                        ):const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    key: const Key('terms_conditions_test'),
                    onTap: (){
                      //link to terms and conditions
                    },
                    child: SizedBox(
                      width: width*0.932,
                      child: Text(
                        'By proceeding, you agree with our Terms & Conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          backgroundColor: Colors.white.withOpacity(0.0),
                          color: Colors.indigo,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}