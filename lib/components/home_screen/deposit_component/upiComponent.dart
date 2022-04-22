import 'package:flutter/material.dart';
import 'package:frontend/components/background/basicCardBackground.dart';
import '../../../screens/upiDepositScreen.dart';

class UPIComponent extends StatefulWidget {
  const UPIComponent({Key? key}) : super(key: key);

  @override
  State<UPIComponent> createState() => _UPIComponentState();
}

class _UPIComponentState extends State<UPIComponent> {

  TextEditingController upiID = TextEditingController();
  bool showUPICard = true;
  bool UPISubmitted = false;
  double heightConstant = 0.42;
  @override
  Widget build(BuildContext context) {
    return CardBackground(
      renderWidget: true,
      setComponentHeightRatio: heightConstant,
      contentWidget: (!UPISubmitted)?Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
              child: Text('Enter your UPI ID',
              style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,9,9,5),
                child: IconButton(
                  onPressed: () {
                    //UPI card gets closed
                    setState(() {
                      showUPICard = false;
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                  ),
                ),
              ),
          ]
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
            child: Text('What UPI handle do you want to use?',
              style: TextStyle(fontSize: 20),),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: TextField(
              controller: upiID,
                key: const Key('upiHandle'),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  icon: Icon(Icons.flash_on_outlined),
                  hintText: 'Enter UPI handle',
                  labelText: 'UPI handle',
                ),
              ),
            ),
          const SizedBox(height: 12,),
          Container(
            alignment: Alignment.center,
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
              ),
              key: const Key('submit'),
              onPressed: () {
                //continue to deposit
                setState(() {
                  UPISubmitted = true;
                  heightConstant = 0.35;
                });
              },
              child: const Text('Submit',style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ):
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
            child: Text(
              'How much do you want to deposit?',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
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
          Container(
            alignment: Alignment.center,
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
              ),
              key: const Key('continueDepositState2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UPIDepositScreen()),
                );
              },
              child: const Text('Continue',style: TextStyle(fontSize: 19),),
            ),
          ),
        ],
      ),
    );
  }
}
