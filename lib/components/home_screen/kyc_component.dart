import 'package:flutter/material.dart';

import '../../constants/index.dart';

class KYC_Component extends StatefulWidget {
  const KYC_Component({Key? key}) : super(key: key);

  @override
  State<KYC_Component> createState() => _KYC_ComponentState();
}

class _KYC_ComponentState extends State<KYC_Component> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(75, 74, 74, 74),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Card(
        color: Colors.amberAccent,
        elevation: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: getDeviceHeight(context) * 0.25,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0,8.0,10.0,5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom:10.0),
                  child: Text('KYC',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                ),
                const Text('Let\'s get started! Enter your PAN number:'),
                const TextField(
                  style: TextStyle(
                    height: 0.8,
                  ),
                  // maxLength: 10, //PAN Number is of 10 digits in India
                  expands: false,
                  decoration: InputDecoration(
                    labelText: 'PAN Number',
                    labelStyle: TextStyle(fontSize: 14)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.lock_rounded,size: 20,),
                      Text(' 100 % Secure ',style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 24,
                  child: ElevatedButton(
                    onPressed: (){
                      //continue to next step
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
