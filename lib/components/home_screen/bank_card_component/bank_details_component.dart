import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class BankDetailsComponent extends StatefulWidget {
  const BankDetailsComponent({Key? key}) : super(key: key);

  @override
  State<BankDetailsComponent> createState() => _BankDetailsComponentState();
}

class _BankDetailsComponentState extends State<BankDetailsComponent> {

  final GlobalKey<FormState> _BankDetailsFormKey = GlobalKey<FormState>();
  bool showBankDetailsCard = true;
  bool bankDetailsSubmitted = false;
  bool bankDetailsVerified = false;
  TextEditingController usernameAsPerBank = TextEditingController();
  double setComponentHeightRatio = 0.53;
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
      child: (showBankDetailsCard)?Card(
        color: Colors.amberAccent,
        elevation: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: getDeviceHeight(context) * setComponentHeightRatio,
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
                        ' Add Bank Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
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
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Form(
                    key: _BankDetailsFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            key: const Key('name'),
                            enableSuggestions: false,
                            controller: usernameAsPerBank,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.characters,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setComponentHeightRatio += heightRatioIncrementInCaseOfErrorText;
                                });
                                return 'This field is compulsory!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.person),
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              suffixIcon: (bankDetailsVerified)?const Icon(Icons.check,color: Colors.green,size: 28,):null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            key: const Key('accNo'),
                            toolbarOptions: const ToolbarOptions(paste: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setComponentHeightRatio += heightRatioIncrementInCaseOfErrorText;
                                });
                                return 'Account Number is compulsory!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.account_balance),
                              hintText: 'Enter your Bank Account No.',
                              labelText: 'Account No.',
                              suffixIcon: (bankDetailsVerified)?const Icon(Icons.check,color: Colors.green,size: 28,):null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            key: const Key('ifscCode'),
                            toolbarOptions: const ToolbarOptions(paste: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setComponentHeightRatio += heightRatioIncrementInCaseOfErrorText;
                                });
                                return 'IFSC Code is compulsory!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.approval_rounded),
                              hintText: 'Enter your IFSC Code',
                              labelText: 'IFSC Code',
                              suffixIcon: (bankDetailsVerified)?const Icon(Icons.check,color: Colors.green,size: 28,):null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: TextFormField(
                            key: const Key('upiCode'),
                            toolbarOptions: const ToolbarOptions(paste: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setComponentHeightRatio += heightRatioIncrementInCaseOfErrorText;
                                });
                                return 'UPI Code is compulsory!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 15),
                              icon: const Icon(Icons.payment_rounded),
                              hintText: 'Enter your UPI ID',
                              labelText: 'UPI',
                              suffixIcon: (bankDetailsVerified)?const Icon(Icons.check,color: Colors.green,size: 28,):null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22,),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: ElevatedButton(
                    key: const Key('bankDetailsContinueState1'),
                    onPressed: () {
                      if (_BankDetailsFormKey.currentState!.validate()) {
                        setState(() {
                          if (bankDetailsVerified){
                            bankDetailsSubmitted = true;
                            setComponentHeightRatio = 0.55;
                          }
                          bankDetailsVerified = true;
                        });
                      }
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
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green[700],
                        size: 45,
                      ),
                    ),
                    const SizedBox(height: 30,),
                     Text(usernameAsPerBank.text,
                      style: const TextStyle(
                        fontSize: 25,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 45,),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      child: ElevatedButton(
                        key: const Key('deposit'),
                        onPressed: () {
                          //continue to deposit
                        },
                        child: const Text('Deposit',style: TextStyle(fontSize: 22),),
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