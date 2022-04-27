import 'package:flutter/material.dart';
import 'package:frontend/components/background/basicCardBackground.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';
import '../../../screens/upiDepositScreen.dart';
import 'package:frontend/utils/upiServices.dart';

class UPIComponent extends StatefulWidget {
  const UPIComponent({Key? key}) : super(key: key);

  @override
  State<UPIComponent> createState() => _UPIComponentState();
}

class _UPIComponentState extends State<UPIComponent> {
  TextEditingController upiID = TextEditingController();
  TextEditingController depositAmount = TextEditingController();
  bool showUPICard = true;
  double heightConstant = 0.42;

  @override
  Widget build(BuildContext context) {
    bool UPISubmitted =
        Provider.of<UserStatusProvider>(context).getBankDetailsStatus;
    return CardBackground(
      renderWidget: true,
      setComponentHeightRatio: heightConstant,
      contentWidget: (!UPISubmitted)
          ? Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        child: Text(
                          'Enter your UPI ID',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 9, 9, 5),
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
                    ]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  child: Text(
                    'What UPI handle do you want to use?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: TextField(
                    controller: upiID,
                    key: const Key('upiHandle'),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      icon: Icon(Icons.flash_on_outlined),
                      hintText: 'Enter UPI Handle',
                      labelText: 'UPI ID',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                    ),
                    key: const Key('submit'),
                    onPressed: () {
                      if(UPIService.verifyUPI(upiID.text)){
                        //continue to deposit
                        setState(() {
                          UPISubmitted = true;
                          heightConstant = 0.35;
                        });
                        Provider.of<UserStatusProvider>(context, listen: false)
                            .setBankDetails(true);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('UPI ID does not exist!'),
                          key: Key('invalidUPI'),
                        ));
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Text(
                    'How much do you want to deposit?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: TextField(
                    controller: depositAmount,
                    key: const Key('depositAmount'),
                    keyboardType: TextInputType.number,
                    onEditingComplete: (){
                      setState(() {
                        depositAmount.text = (double.parse(depositAmount.text)).toStringAsFixed(2);
                      });
                    },
                    decoration: const InputDecoration(
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
                      if(double.parse(depositAmount.text)<100){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          key: const Key('invalidAmount'),
                          content: const Text('Please enter an amount of at least 100 INR.',
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                          backgroundColor: Colors.redAccent,
                          action: SnackBarAction(
                            label: 'OK',
                            textColor: Colors.amberAccent,
                            onPressed: () {
                              // Do Nothing, just an 'OK' button looks good
                            },
                          ),
                        ));
                      }
                      else{
                        depositAmount.text = (double.parse(depositAmount.text)).toStringAsFixed(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UPIDepositScreen(
                                depositAmount: depositAmount.text,
                                upiID: upiID.text,)),
                        );
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
