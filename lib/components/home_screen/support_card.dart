import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
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
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Text('Support',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Text('Got queries? Catch us on WhatsApp!',style: TextStyle(fontSize: 16)),
            ),
            const Padding(
              padding: EdgeInsets.only(top:8),
              child: Icon(Icons.whatsapp,color: Colors.green,size: 30,key: Key('whatsappIcon'),),
            ),
            OutlinedButton(
                onPressed: (){debugPrint('Received click');},
                style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 0.0, color: Colors.white),
              ),
                child: const Text('Talk Now',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                    key: Key('talkNowButton'),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
