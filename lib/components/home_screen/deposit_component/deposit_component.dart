import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/components/home_screen/bank_card_component/bank_details_component.dart';

class DepositComponent extends StatefulWidget {
  const DepositComponent({Key? key}) : super(key: key);

  @override
  State<DepositComponent> createState() => _DepositComponentState();
}

class _DepositComponentState extends State<DepositComponent> {

  bool showDepositCard = true;
  bool amountEntered = false;
  bool accountDetailsConfirmed = false;
  TextEditingController depositAmount = TextEditingController();
  double setComponentHeightRatio = 0.46;
  double heightRatioIncrementInCaseOfErrorText = 0.04;

  String errorMessageDeposit = "";

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
          child: (!amountEntered)?Column(
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
                    fontSize: 20, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 20,),
               Padding(
                padding: const EdgeInsets.fromLTRB(65,18,80,18),
                child: TextField(
                  key: const Key('depositAmount'),
                  controller: depositAmount,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.currency_rupee),
                    hintText: 'Enter Deposit Amount',
                    labelText: 'Amount',
                    errorText: errorMessageDeposit,
                  ),
                  onChanged: (text){
                    if (text!=""){
                      setState(() {
                        errorMessageDeposit = "";
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                alignment: Alignment.center,
                height: 30,
                child: ElevatedButton(
                  key: const Key('deposit'),
                  onPressed: () {
                    //continue to deposit
                    if (depositAmount.text != "") {
                      setState(() {
                        amountEntered = true;
                      });
                    }
                    else{
                      setState(() {
                        errorMessageDeposit = 'Enter valid deposit amount!';
                      });
                    }
                  },
                  child: const Text('Deposit',style: TextStyle(fontSize: 18),),
                ),
              ),
            ],
          ):
          (!accountDetailsConfirmed)?
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text(
                'Transfer to the following Virtual Account',
                style: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          key: const Key('name'),
                          enabled: false,
                          initialValue: 'User Name',
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(Icons.person),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          key: const Key('accNo'),
                          enabled: false,
                          initialValue: '1234567890',
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(Icons.account_balance),
                            hintText: 'Enter your Bank Account No.',
                            labelText: 'Account No.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          key: const Key('ifscCode'),
                          enabled: false,
                          initialValue: 'ABCD1234567',
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(Icons.approval_rounded),
                            hintText: 'Enter your IFSC Code',
                            labelText: 'IFSC Code',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 32,
                child: ElevatedButton(
                  key: const Key('continueDepositState2'),
                  onPressed: () {
                    //continue to deposit
                    setState(() {
                      accountDetailsConfirmed = true;
                      setComponentHeightRatio = 0.34;
                     });
                  },
                  child: const Text('Continue',style: TextStyle(fontSize: 22),),
                ),
              ),
            ],
          ):
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 22.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green[700],
                  size: 45,
                ),
              ),
              const Text(
                ' User Name ',
                style: TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.white,
                ),
              ),
               const SizedBox(height: 28,),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Rs. ${depositAmount.text} Deposit Successful',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ):null
    );
  }
}