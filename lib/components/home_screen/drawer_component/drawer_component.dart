import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_footer.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_header.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_list_item.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Add a drawer header here and add functionality
              const CloseDrawerComponent(),

              DrawerListComponent(
                title: "FAQs",
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              DrawerListComponent(
                title: "Settings",
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              DrawerListComponent(
                title: "About",
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              DrawerListComponent(
                title: "Withdraw",
                onClick: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const DrawerFooter(),
        ],
      ),
    );
  }
}
