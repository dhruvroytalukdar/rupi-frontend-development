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
    String link = 'https://www.onlazer.com';
    //add more links and change accordingly
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.6, color: Colors.black),
          // gradient: LinearGradient(colors: [Colors.orangeAccent,Color(0xFFCA436B),Color(0xFF915FB5),Colors.indigoAccent],
          //     begin: FractionalOffset.topLeft,
          //     end: FractionalOffset.bottomRight,
          // ),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Text('More',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,2),
              child: TextButton(
                onPressed: (){launch(link);},
                child: Text('FAQs',style: const TextStyle(fontSize: 16),textAlign: TextAlign.left,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,2),
              child: TextButton(
                  onPressed: (){launch(link);},
                  child: Text('Settings',style: const TextStyle(fontSize: 16),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,2),
              child: TextButton(
                  onPressed: (){launch(link);},
                  child: Text('About',style: const TextStyle(fontSize: 16),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
