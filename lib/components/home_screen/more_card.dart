import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {

  @override
  Widget build(BuildContext context) {
    String faqLink = 'https://www.onlazer.com';
    String settingsLink = 'https://www.onlazer.com';
    String aboutLink = 'https://www.onlazer.com';
    //add more links and change accordingly
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),backgroundBlendMode: BlendMode.luminosity,
          border: Border.all(width: 0.7, color: Colors.grey),
          // gradient: LinearGradient(colors: [Colors.orangeAccent,Color(0xFFCA436B),Color(0xFF915FB5),Colors.indigoAccent],
          //     begin: FractionalOffset.topLeft,
          //     end: FractionalOffset.bottomRight,
          // ),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: Text('More',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,0),
              child: TextButton(
                  key: const Key('FAQButton'),
                  onPressed: (){launch(faqLink);},
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('FAQs',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            decorationThickness: 2),
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,0),
              child: TextButton(
                  key: const Key('settingsButton'),
                  onPressed: (){launch(settingsLink);},
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Settings',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            decorationThickness: 2),
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,0),
              child: TextButton(
                  key: const Key('aboutButton'),
                  onPressed: (){launch(aboutLink);},
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('About',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            decorationThickness: 2),
                        )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
