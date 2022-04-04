import 'package:flutter/material.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Support",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Icon(
          Icons.whatsapp,
          size: 48.0,
          color: Colors.green[800],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Talk Now",
            style: TextStyle(
              fontSize: 17.5,
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
