import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:frontend/components/background/background_designV2.dart';
import '../components/home_screen/deposit_component/upiList.dart';

class UPIDepositScreen extends StatefulWidget {
  final String? depositAmount;
  final String? upiID;
  const UPIDepositScreen({Key? key,this.depositAmount, this.upiID}) : super(key: key);

  @override
  State<UPIDepositScreen> createState() => _UPIDepositScreenState(this.depositAmount,this.upiID);
}

class _UPIDepositScreenState extends State<UPIDepositScreen> {

  String? depositAmount;
  String? upiID;
  _UPIDepositScreenState(this.depositAmount,this.upiID);
  double INRDepositAmount = 0;
  double USDTExchangeRate = 80.80;
  double USDTInvestmentAmount = 124.72;
  double fees = 0.00;
  double interestRate = 14.3;

  @override
  Widget build(BuildContext context) {
    INRDepositAmount = double.parse(depositAmount!);
    return BackgroundDesignV2(
      gradient: GradientColors.marbleWall,
        contentWidget: SizedBox(
          height:double.infinity,
          width:double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,5),
                  child: IconButton(
                    key: const Key('back'),
                    visualDensity: const VisualDensity(horizontal: 2,vertical: 2),
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
                  padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 25),
                  child: Text('Investment Amount',
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),),
                ),
              ]
          ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(50,10,0,10),
                  child: Text('\u{20B9} $INRDepositAmount',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0,0,30,0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('USDT Exchange Rate',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('\u{20B9} $USDTExchangeRate',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('USDT to be invested',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('\u{20B9} $USDTInvestmentAmount',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Fees',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('\u{20B9} $fees',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                       const SizedBox(height: 30,),
                       Text('You will earn $interestRate % per annum on $USDTInvestmentAmount USDT',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 60,),
                    ],
                  ),
                ),
                UPIList(depositAmount: depositAmount,upiID: upiID,),
          ],
          )
        )
    );
  }
}
