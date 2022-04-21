import 'package:flutter/material.dart';
import 'package:frontend/components/background/basicCardBackground.dart';

class UPIComponent extends StatelessWidget {
  const UPIComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      setComponentHeightRatio: 0.4,
      contentWidget: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: Text('Enter your UPI ID',
            style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
            child: Text('What UPI handle do you want to use?',
              style: TextStyle(fontSize: 20),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: TextField(
                key: Key('depositAmount'),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  icon: Icon(Icons.flash_on_outlined),
                  hintText: 'Enter UPI handle',
                  labelText: 'UPI handle',
                ),
              ),
            ),
          const SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            height: 32,
            child: ElevatedButton(
              key: const Key('submit'),
              onPressed: () {
                //continue to deposit
              },
              child: const Text('Submit',style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      )
    );
  }
}
