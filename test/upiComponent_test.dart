import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/deposit_component/upiComponent.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';

void main() {
  _pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider(testUser)),
            ChangeNotifierProvider(
              create: (_) => UserStatusProvider(true, false, false, false),
            ),
          ],
          child: const UPIComponent(),
        ),
      ),
    );
  }

  testWidgets('Submit button is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final submitButton = find.byKey(const Key('submit'));

    // Start the app for testing
    await _pumpWidget(tester);

    // Test Results
    expect(submitButton, findsOneWidget);
  });

  testWidgets('UPI Handle Text field is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final upiHandleTextfield = find.byKey(const Key('upiHandle'));

    // Start the app for testing
    await _pumpWidget(tester);

    // Test Results
    expect(upiHandleTextfield, findsOneWidget);
  });

  testWidgets('Continue button is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final continueDepositState2Button =
        find.byKey(const Key('continueDepositState2'));
    final upiHandleTextfield = find.byKey(const Key('upiHandle'));
    final submitButton = find.byKey(const Key('submit'));

    // Start the app for testing
    await _pumpWidget(tester);
    //Enter upi id
    await tester.enterText(upiHandleTextfield, 'awakeuser@sdkbank');
    await tester.tap(submitButton);
    // Rebuild the widget after the state has changed.
    await tester.pump(const Duration(seconds: 2));

    // Test Results
    expect(continueDepositState2Button, findsOneWidget);
  });

  testWidgets('Deposit Amount Text Field is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final depositAmountTextField = find.byKey(const Key('depositAmount'));
    final upiHandleTextfield = find.byKey(const Key('upiHandle'));
    final submitButton = find.byKey(const Key('submit'));

    // Start the app for testing
    await _pumpWidget(tester);
    //Enter upi id
    await tester.enterText(upiHandleTextfield, 'awakeuser@sdkbank');
    await tester.tap(submitButton);
    // Rebuild the widget after the state has changed.
    await tester.pump(const Duration(seconds: 2));

    // Test Results
    expect(depositAmountTextField, findsOneWidget);
  });
}
