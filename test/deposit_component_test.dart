import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/deposit_component/deposit_component.dart';
import 'package:frontend/components/home_screen/kyc_component/kyc_component.dart';

void main() {
  testWidgets('Deposit button is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final depositButton = find.byKey(const Key('deposit'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: DepositComponent()));

        // Test Results
        expect(depositButton, findsOneWidget);
      });

  testWidgets('Deposit Amount Text field is showing correctly or not.',
          (WidgetTester tester) async {
        // Get the widget
        final depositAmount = find.byKey(const Key('depositAmount'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: DepositComponent()));
        await tester.enterText(depositAmount, '1000');

        // Test Results
        expect(depositAmount, findsOneWidget);
      });
}
