import 'package:flutter/material.dart';
import 'package:frontend/screens/upiPayScreen.dart';

class UPIList extends StatefulWidget {
  const UPIList({Key? key}) : super(key: key);

  @override
  State<UPIList> createState() => _UPIListState();
}

class _UPIListState extends State<UPIList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0,0,25,0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 2),
            child: Text('UPI',
              style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),),
          ),
          const Divider(
              thickness: 2,
              color: Colors.black
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PhonePe',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    //to PhonePe
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UPIPayScreen()));
                  });
                },
                icon: const Icon(
                  Icons.send,
                  size: 22,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('GooglePay',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    //to GooglePay
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UPIPayScreen()));
                  });
                },
                icon: const Icon(
                  Icons.send,
                  size: 22,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PayTM',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    //to PayTM
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UPIPayScreen()));
                  });
                },
                icon: const Icon(
                  Icons.send,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
