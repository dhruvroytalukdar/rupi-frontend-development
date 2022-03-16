import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Holdings extends StatefulWidget {
  const Holdings({Key? key}) : super(key: key);

  @override
  State<Holdings> createState() => _HoldingsState();
}

class _HoldingsState extends State<Holdings> {

  DateTime currDate = DateTime.now();
  static final _dayMap = {1: 'st', 2: 'nd', 3: 'rd'};
  static String dayOfMonth(int day) => "$day${_dayMap[day] ?? 'th'}";

  double investedAmount=0, overallReturns=0, currentValue=0;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd MMMM, yyyy').format(currDate);
    date = dayOfMonth(currDate.day)+date.substring(2);
    investedAmount=1000; overallReturns=5000; currentValue=6000;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.6, color: Colors.black),
          // gradient: LinearGradient(colors: [Colors.orangeAccent,Color(0xFFCA436B),Color(0xFF915FB5),Colors.indigoAccent],
          //     begin: FractionalOffset.topLeft,
          //     end: FractionalOffset.bottomRight,
          // ),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Holdings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  Text('as on $date',style: const TextStyle(fontSize: 16,color: Colors.black87)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Text('Invested Amount',style: TextStyle(fontSize: 16)),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,8.0),
              child: Text('INR. $investedAmount',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,8.0,8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Overall Returns',style: TextStyle(fontSize: 16)),
                  Text('Current Value',style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,8.0,8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('INR. $overallReturns',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
                  Text('INR. $currentValue',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('The value of your portfolio will fluctuate based on current crypto market conditions. ',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center
              ),
            ),
          ],
        ),
      ),
    );
  }
}
