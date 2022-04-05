import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/create_account_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/otp_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/screens/verify_screen.dart';
import 'package:frontend/screens/welcome_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(null)),
        ChangeNotifierProvider(
            create: (_) => UserStatusProvider(false, false, false, false)),
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
      },
    );
  }
}
