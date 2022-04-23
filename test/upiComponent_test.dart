import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/deposit_component/upiComponent.dart';

void main() {
  testWidgets('Submit button is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final submitButton = find.byKey(const Key('submit'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIComponent()));

        // Test Results
        expect(submitButton, findsOneWidget);
      });

  testWidgets('UPI Handle Text field is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final upiHandleTextfield = find.byKey(const Key('upiHandle'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIComponent()));

        // Test Results
        expect(upiHandleTextfield, findsOneWidget);
      });

  testWidgets('Continue button is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final continueDepositState2Button = find.byKey(const Key('continueDepositState2'));
        final submitButton = find.byKey(const Key('submit'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIComponent()));
        await tester.tap(submitButton);
        // Rebuild the widget after the state has changed.
        await tester.pump();

        // Test Results
        expect(continueDepositState2Button, findsOneWidget);
      });

  testWidgets('Deposit Amount Text Field is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final depositAmountTextField = find.byKey(const Key('depositAmount'));
        final submitButton = find.byKey(const Key('submit'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIComponent()));
        await tester.tap(submitButton);
        // Rebuild the widget after the state has changed.
        await tester.pump();

        // Test Results
        expect(depositAmountTextField, findsOneWidget);
      });
}
