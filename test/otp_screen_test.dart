import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/models/otf_verification_model.dart';
import 'package:frontend/screens/otp_screen.dart';
import 'package:frontend/utils/verify_input.dart';
import 'mock.dart';

void main() {
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Resend OTP button is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final resendButton = find.byKey(const Key('resend_otp_button'));
    final OTPModel mock =
        OTPModel(resendToken: 0, phoneNumber: "", verificationId: "");

    // Show the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onGenerateRoute: (_) {
            return MaterialPageRoute<Widget>(
              builder: (_) => const OTPScreen(),
              settings: RouteSettings(arguments: mock),
            );
          },
        ),
      ),
    );

    // Test Results
    expect(resendButton, findsOneWidget);
  });

  testWidgets('Continue button is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final continueButton = find.byKey(const Key('otp_continue_button'));
    final OTPModel mock =
        OTPModel(resendToken: 0, phoneNumber: "", verificationId: "");

    // Show the widget
    await tester.pumpWidget(MaterialApp(
      home: Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute<Widget>(
            builder: (_) => const OTPScreen(),
            settings: RouteSettings(arguments: mock),
          );
        },
      ),
    ));

    // Test Results
    expect(continueButton, findsOneWidget);
  });

  test("Check if the isUsingEmail function works", () {
    expect(isUsingEmail("dhruv@lazer.com"), isNotNull);
    expect(isUsingEmail("dhruv@lazer.com"), true);
    expect(isUsingEmail("9876543210"), isNotNull);
    expect(isUsingEmail("9876543210"), false);
  });
}
