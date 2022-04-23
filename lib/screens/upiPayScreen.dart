import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:frontend/components/background/background_designV2.dart';
import 'package:flutter/services.dart';

class UPIPayScreen extends StatefulWidget {
  const UPIPayScreen({Key? key}) : super(key: key);

  @override
  State<UPIPayScreen> createState() => _UPIPayScreenState();
}

class _UPIPayScreenState extends State<UPIPayScreen> {
  String UPI_ID = 'kingarthur@okicici';
  String onLazerUPI_ID = 'wegrowyourwealth@hdfcbank';
  final TextEditingController upiTextController = TextEditingController();
  double INRDepositAmount = 1000;

  // This function is triggered when the copy icon is pressed
  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: upiTextController.text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('UPI ID Copied!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    upiTextController.text = onLazerUPI_ID;
    return BackgroundDesignV2(
        gradient: GradientColors.marbleWall,
        contentWidget: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: IconButton(
                      key: const Key('back'),
                      visualDensity:
                          const VisualDensity(horizontal: 2, vertical: 2),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 35,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 25),
                    child: Text(
                      'Pay',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                  child: Text(
                    '\u{20B9} $INRDepositAmount',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    'TO ON LAZER\'S UPI ID',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 40, 0),
                  child: TextField(
                    key: const Key('onLazerUPI'),
                    controller: upiTextController,
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.blueGrey,
                          size: 28,
                        ),
                        onPressed: copyToClipboard,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    'FROM UPI ID',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    UPI_ID,
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45,0,52,0),
                  child: TextFormField(
                    key: const Key('noteText'),
                    maxLines: 7, //change this according to required height
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      labelText: 'Note',
                      labelStyle: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    textAlign: TextAlign.justify,
                    readOnly: true,
                    initialValue:
                        "1. Transaction Amount should exactly be Rs. 1000\n"
                        "2. Only Transactions made from $UPI_ID UPI ID will be accepted\n"
                        "3. It will take 48 hrs for your investment to reflect on your app",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: ElevatedButton(
                    key: const Key('madePayment'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    onPressed: () {
                      //next step
                    },
                    child: const Text(
                      'I\'ve made the payment',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: ElevatedButton(
                    key: const Key('cancelPayment'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                    ),
                    onPressed: () {
                      //cancel
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )));
  }
}
