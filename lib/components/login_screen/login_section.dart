import 'package:flutter/material.dart';
import 'package:frontend/components/welcome_screen/social_button.dart';

// Login Section is the outer wrapper of all the text widgets and buttons
class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      // This will make the sizedBox extend upto 100% of screen width and height
      height:double.infinity,
      width:double.infinity,

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Login",
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
                children:  [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15,8,15,2),
                    child: Text(
                      "EMAIL/PHONE NUMBER",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '************',
                      ),
                    ),
                  ),
                  GestureDetector(
                    key: const Key('continue_test'),
                    onTap: (){},
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
