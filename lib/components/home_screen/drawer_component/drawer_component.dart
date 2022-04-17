import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_footer.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_header.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_list_item.dart';
import 'package:frontend/utils/auth_utils.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

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
                  Navigator.pushNamed(context, '/withdrawfunds');
                },
              ),
              DrawerListComponent(
                title: "Logout",
                onClick: () async {
                  await Auth(authInstance: auth).logoutUser();
                  // Provider.of<UserProvider>(context, listen: false).resetUser();
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/welcome');
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
