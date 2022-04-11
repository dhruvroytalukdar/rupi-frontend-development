import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class DepositComponent extends StatefulWidget {
  const DepositComponent({Key? key}) : super(key: key);

  @override
  State<DepositComponent> createState() => _DepositComponentState();
}

class _DepositComponentState extends State<DepositComponent> {

  bool showDepositCard = true;
  double setComponentHeightRatio = 0.43;
  double heightRatioIncrementInCaseOfErrorText = 0.04;

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
      child: (showDepositCard)?Card(
        color: Colors.amberAccent,
        elevation: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: getDeviceHeight(context) * setComponentHeightRatio,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,9,9,16),
                    child: IconButton(
                      onPressed: () {
                        //kyc card gets closed
                        setState(() {
                          showDepositCard = false;
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'How much do you want to deposit?',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.fromLTRB(65,18,80,18),
                child: TextField(
                  key: Key('depositAmount'),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    icon: Icon(Icons.currency_rupee),
                    hintText: 'Enter Deposit Amount',
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                height: 32,
                child: ElevatedButton(
                  key: const Key('deposit'),
                  onPressed: () {
                    //continue to deposit
                  },
                  child: const Text('Deposit',style: TextStyle(fontSize: 21),),
                ),
              ),
            ],
          ),
        ),
      ):null
    );
  }
}