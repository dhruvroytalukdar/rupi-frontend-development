import 'package:datadog_flutter/datadog_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/home_screen/content_section.dart';
import 'package:frontend/components/home_screen/deposit_component/deposit_component.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_component.dart';
import 'package:frontend/components/home_screen/background_component/dual_background.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

class RootComponent extends StatelessWidget {
  const RootComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    bool showFloatingActionButton =
        !Provider.of<UserStatusProvider>(context).getIfDepositingMoney;

    // showFloatingActionButton =
    //     true; //TODO: Remove this line @Dhruv to make deposit button reappear

    logDatadog() {
      print("Inside");
      final ddLogger = DatadogLogger(loggerName: 'orders');
      // optionally set a value for HOST
      // ddLogger.addAttribute('hostname', <DEVICE IDENTIFIER>);

      ddLogger.addTag('restaurant_type', 'pizza');
      ddLogger.removeTag('restaurant_type');

      // add attribute to every log
      ddLogger.addAttribute('toppings', 'extra_cheese');

      // add atttributes to some logs
      ddLogger.log('time to cook pizza', Level.INFO, attributes: {
        'durationInMilliseconds': 1003256086,
      });
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.homeScreenUpperBackground,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.homeScreenUpperBackground,
            elevation: 0.0,
          ),
          floatingActionButton: showFloatingActionButton
              ? FloatingActionButton.extended(
                  backgroundColor: AppColors.homeScreenUpperBackground,
                  onPressed: () {
                    Provider.of<UserStatusProvider>(context, listen: false)
                        .toggleDepositingMoney();
                    // logDatadog();
                  },
                  label: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "+",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        " Deposit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          endDrawer: const DrawerComponent(),
          body: Stack(
            children: const [
              BackgroundComponent(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: ContentSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
