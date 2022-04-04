import 'package:flutter/material.dart';

class CloseDrawerComponent extends StatelessWidget {
  const CloseDrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: DrawerHeader(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                key: Key("drawer_close_button"),
                size: 32.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
