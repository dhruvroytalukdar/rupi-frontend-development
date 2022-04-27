import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/upiDepositScreen.dart';
import 'package:frontend/screens/upiPayScreen.dart';

void main() {
  testWidgets('Back button is showing correctly or not (Deposit Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final backButton = find.byKey(const Key('back'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIDepositScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(backButton, findsOneWidget);
      });

  testWidgets('To-PhonePe Icon button is showing correctly or not (Deposit Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final toPhonePeButton = find.byKey(const Key('toPhonePe'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIDepositScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(toPhonePeButton, findsOneWidget);
      });

  testWidgets('To-PhonePe Icon button is showing correctly or not (Deposit Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final toGooglePayButton = find.byKey(const Key('toGooglePay'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIDepositScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(toGooglePayButton, findsOneWidget);
      });

  testWidgets('To-PayTM Icon button is showing correctly or not (Deposit Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final toPayTMButton = find.byKey(const Key('toPayTM'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIDepositScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(toPayTMButton, findsOneWidget);
      });

  testWidgets('Payment Confirmation button is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final madePaymentButton = find.byKey(const Key('madePayment'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(madePaymentButton, findsOneWidget);
      });

  testWidgets('Cancel button is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final cancelButton = find.byKey(const Key('cancelPayment'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(cancelButton, findsOneWidget);
      });

  testWidgets('Back button is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final backButton = find.byKey(const Key('back'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(backButton, findsOneWidget);
      });

  testWidgets('OnLazer UPI is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final onLazerUPITextField = find.byKey(const Key('onLazerUPI'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(onLazerUPITextField, findsOneWidget);
      });

  testWidgets('Note Text is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        // Get the widget
        final noteTextField = find.byKey(const Key('noteText'));

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(noteTextField, findsOneWidget);
      });

  testWidgets('User UPI ID is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {

        // Start the app for testing
        await tester.pumpWidget(const MaterialApp(home: UPIPayScreen(depositAmount: '1000',upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(find.text('kingarthur@rtb'), findsOneWidget);
      });

  testWidgets('Deposit Amount is showing correctly or not (Pay Screen).',
          (WidgetTester tester) async {
        Random random = Random();
        String deposit = '\u{20B9} '+(random.nextDouble() + 100).toStringAsFixed(2);

        // Start the app for testing
        await tester.pumpWidget(MaterialApp(home: UPIPayScreen(depositAmount: deposit,upiID: 'kingarthur@rtb',)));

        // Test Results
        expect(find.text(deposit), findsOneWidget);
      });
}
