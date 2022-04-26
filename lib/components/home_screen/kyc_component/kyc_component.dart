import 'package:flutter/material.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/utils/kycServices.dart';
import 'package:provider/provider.dart';
import 'package:screen_loader/screen_loader.dart';

class KYC_Component extends StatefulWidget {
  const KYC_Component({Key? key}) : super(key: key);

  @override
  State<KYC_Component> createState() => _KYC_ComponentState();
}

class _KYC_ComponentState extends State<KYC_Component> with ScreenLoader {
  bool isPANsubmitted = false;
  bool isNameConfirmed = false;
  bool showKYCcard = true;
  bool isPANValid = true;
  TextEditingController panNumber = TextEditingController();
  TextEditingController panName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var errorSnack = SnackBar(
      content: const Text('Enter a valid PAN Number!'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          setState(() {
            panNumber.text = "";
          });
        },
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 55.0, bottom: 15.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(75, 74, 74, 74),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: (showKYCcard)
            ? loadableWidget(
                child: Card(
                  color: Colors.amberAccent,
                  elevation: 0.1,
                  child: SizedBox(
                    width: double.infinity,
                    height: getDeviceHeight(context) * 0.42,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
                      child: (!isPANsubmitted)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 9.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'KYC : PAN Number',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
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
                                const Text(
                                    'Let\'s get started! Enter your PAN number:'),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 11.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.insert_drive_file,
                                        size: 20,
                                      ),
                                      Text(
                                        ' No Documents ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.lock_rounded,
                                        size: 20,
                                      ),
                                      Text(
                                        ' 100% Secure ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getDeviceHeight(context) * 0.051,
                                  child: ElevatedButton(
                                    key: const Key('kycContinueState1'),
                                    onPressed: () async {
                                      panName.text = await performFuture(KYCService.verifyPAN);
                                      if (panNumber.text == "" ||
                                          (!isPANValid)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(errorSnack);
                                      } else {
                                        setState(() {
                                          isPANsubmitted = true;
                                        });
                                      }
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : (isNameConfirmed)
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green[700],
                                        size: 45,
                                      ),
                                    ),
                                    Text(
                                      panNumber.text,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                      child: Text(
                                        'Successfully Verified',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 28,
                                      child: ElevatedButton(
                                        key: const Key('kycContinueState2'),
                                        onPressed: () {
                                          //continue to next step
                                          Provider.of<UserStatusProvider>(
                                                  context,
                                                  listen: false)
                                              .setKYC(true);
                                          setState(() {
                                            showKYCcard = false;
                                          });
                                        },
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "Please confirm your name:",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                     Text(
                                      panName.text,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: getDeviceHeight(context) * 0.052,
                                      child: ElevatedButton(
                                        key: const Key('kycNameConfirm'),
                                        onPressed: () {
                                          setState(() {
                                            isNameConfirmed = true;
                                          });
                                        },
                                        child: const Text(
                                          'Confirm',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
