import 'package:datadog_flutter/datadog_flutter.dart';
import 'package:datadog_flutter/datadog_observer.dart';
import 'package:datadog_flutter/datadog_rum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:frontend/screens/create_account_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/otp_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/screens/upiDepositScreen.dart';
import 'package:frontend/screens/verify_screen.dart';
import 'package:frontend/screens/welcome_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frontend/screens/withdraw_funds_screen.dart';
import 'package:provider/provider.dart';
import 'package:screen_loader/screen_loader.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatadogFlutter.initialize(
    clientToken: "puba62f55544838407a04f887c9806fdafe",
    serviceName: 'lazer-frontend-app',
    environment: 'production',
    trackingConsent: TrackingConsent.granted,
  );

  FlutterError.onError = DatadogRum.instance.addFlutterError;
  await DatadogFlutter.setUserInfo(id: "my-phone");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configScreenLoader(
    loader: const AlertDialog(
      title: Text('Verifying Details..'),
    ),
    bgBlur: 1.0,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(null),
        ),
        ChangeNotifierProvider(
          create: (_) => UserStatusProvider(false, false, false, false),
        ),
        ChangeNotifierProvider(
          create: (_) => WithdrawStatusProvider(false, false, false),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      initialRoute: auth.currentUser == null ? '/welcome' : '/home',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignupScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/verify': (context) => const VerifyScreen(),
        '/otpverify': (context) => const OTPScreen(),
        '/withdrawfunds': (context) => const WithDrawFundsScreen(),
        '/upi-deposit': (context) => const UPIDepositScreen(),
        '/upi-pay': (context) => const UPIDepositScreen(),
      },
      navigatorObservers: [
        DatadogObserver(),
      ],
    );
  }
}
