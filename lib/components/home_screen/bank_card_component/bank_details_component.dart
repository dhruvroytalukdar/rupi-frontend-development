import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class BankDetailsComponent extends StatefulWidget {
  const BankDetailsComponent({Key? key}) : super(key: key);

  @override
  State<BankDetailsComponent> createState() => _BankDetailsComponentState();
}

class _BankDetailsComponentState extends State<BankDetailsComponent> {
  bool showBankDetailsCard = true;
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
      child: (showBankDetailsCard)
          ? Card(
              color: Colors.amberAccent,
              elevation: 0.1,
              child: SizedBox(
                width: double.infinity,
                height: getDeviceHeight(context) * 0.28,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
                  child: (!bankDetailsVerified)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 9.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Add Bank Details',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
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
                                children: [TextFormField()],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 24,
                              child: ElevatedButton(
                                key: const Key('kycContinueState1'),
                                onPressed: () {
                                  setState(() {});
                                },
                                child: const Text('Continue'),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green[700],
                                size: 45,
                              ),
                            ),
                            Text(
                              'Hello',
                              style: const TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Successfully Verified',
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
            )
          : null,
    );
  }
}
