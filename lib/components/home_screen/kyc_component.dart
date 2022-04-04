import 'package:flutter/material.dart';

import '../../constants/index.dart';

class KYC_Component extends StatefulWidget {
  const KYC_Component({Key? key}) : super(key: key);

  @override
  State<KYC_Component> createState() => _KYC_ComponentState();
}

class _KYC_ComponentState extends State<KYC_Component> {

  bool isPANsubmitted = false;
  bool showKYCcard = true;
  TextEditingController panNumber = TextEditingController();

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
      child: (showKYCcard)?Card(
        color: Colors.amberAccent,
        elevation: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: getDeviceHeight(context) * 0.3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
            child: (!isPANsubmitted)?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'KYC',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                        onPressed: () {
                          //kyc card gets closed
                          setState(() {
                            showKYCcard = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('Let\'s get started! Enter your PAN number:'),
                TextField(
                  key: const Key('panField'),
                  controller: panNumber,
                  style: const TextStyle(
                    height: 0.8,
                  ),
                  // maxLength: 10, //PAN Number is of 10 digits in India
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: 'PAN Number',
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.lock_rounded,
                        size: 20,
                      ),
                      Text(
                        ' 100 % Secure ',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 24,
                  child: ElevatedButton(
                    key: const Key('kycContinueState1'),
                    onPressed: () {
                      setState(() {
                        isPANsubmitted = true;
                      });
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green[700],
                    size: 45,
                  ),
                ),
                Text(panNumber.text,
                  style: const TextStyle(
                      fontSize: 20,
                      backgroundColor: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Successfully Verified',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  child: ElevatedButton(
                    key: const Key('kycContinueState2'),
                    onPressed: () {
                      //continue to next step
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ):
      null,
    );
  }
}
