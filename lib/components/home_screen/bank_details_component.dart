import 'package:flutter/material.dart';

import '../../constants/index.dart';

class BankDetailsComponent extends StatefulWidget {
  const BankDetailsComponent({Key? key}) : super(key: key);

  @override
  State<BankDetailsComponent> createState() => _BankDetailsComponentState();
}

class _BankDetailsComponentState extends State<BankDetailsComponent> {

  bool showBankDetailsCard = true;
  bool bankDetailsSubmitted = false;
  bool bankDetailsVerified = false;

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
      child: (showBankDetailsCard)?Card(
        color: Colors.amberAccent,
        elevation: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: getDeviceHeight(context) * 0.45,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
            child: (!bankDetailsSubmitted)?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add Bank Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                        onPressed: () {
                          //kyc card gets closed
                          setState(() {
                            showBankDetailsCard = false;
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
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                              key: const Key('name'),
                              decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              icon: Icon(Icons.person),
                              hintText: 'Enter your name',
                              labelText: 'Name',
                        ),
                        ),
                        TextFormField(
                          key: const Key('accNo'),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(Icons.account_balance),
                            hintText: 'Enter your Bank Account No.',
                            labelText: 'Account No.',
                          ),
                        ),
                        TextFormField(
                          key: const Key('ifscCode'),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(Icons.approval_rounded),
                            hintText: 'Enter your IFSC Code',
                            labelText: 'IFSC Code',
                          ),
                        ),
                        TextFormField(
                          key: const Key('upiCode'),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 15),
                            icon: Icon(Icons.payment_rounded),
                            hintText: 'Enter your UPI ID',
                            labelText: 'UPI',
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: ElevatedButton(
                    key: const Key('bankDetailsContinueState1'),
                    onPressed: () {
                      setState(() {
                        bankDetailsSubmitted = true;
                      });
                    },
                    child: const Text('Continue',style: TextStyle(fontSize: 17),),
                  ),
                ),
              ],
            ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    //kyc card gets closed
                    setState(() {
                      showBankDetailsCard = false;
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green[700],
                        size: 45,
                      ),
                    ),
                    const Text('User Name',
                      style: TextStyle(
                        fontSize: 20,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Container(
                      alignment: Alignment.center,
                      height: 28,
                      child: ElevatedButton(
                        key: const Key('deposit'),
                        onPressed: () {
                          //continue to deposit
                        },
                        child: const Text('Deposit',style: TextStyle(fontSize: 20),),
                      ),
                    ),
                  ],
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

