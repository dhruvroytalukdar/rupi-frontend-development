import 'package:flutter/material.dart';

class DrawerListComponent extends StatefulWidget {
  final String title;
  final Function onClick;
  const DrawerListComponent(
      {Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  State<DrawerListComponent> createState() => _DrawerListComponentState();
}

class _DrawerListComponentState extends State<DrawerListComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key("drawer_list_items"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: () => widget.onClick(),
    );
  }
}
