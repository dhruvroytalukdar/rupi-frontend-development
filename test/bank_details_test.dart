import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/bank_details_component.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:provider/provider.dart';

void main(){

  // Utility function to load the screen in a material app
  _pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider(testUser)),
            ChangeNotifierProvider(
                create: (_) => UserStatusProvider(true, false, false, false)),
          ],
          child: const BankDetailsComponent(),
        ),
      ),
    );
  }

  testWidgets('Continue button is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final bankDetailsContinueState1Button = find.byKey(const Key('bankDetailsContinueState1'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));

    // Test Results
    expect(bankDetailsContinueState1Button,findsOneWidget);
  });

  testWidgets('Account Number Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final accountNumber = find.byKey(const Key('accNo'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));
    await tester.enterText(accountNumber, 'LDPE123456');

    // Test Results
    expect(accountNumber,findsOneWidget);
  });

  testWidgets('Name Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final name = find.byKey(const Key('name'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));
    await tester.enterText(name, 'User Name');

    // Test Results
    expect(name,findsOneWidget);
  });

  testWidgets('IFSC Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final ifscCodeField = find.byKey(const Key('ifscCode'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));
    await tester.enterText(ifscCodeField, '12340567890');

    // Test Results
    expect(ifscCodeField,findsOneWidget);
  });

  testWidgets('UPI Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final upiCodeField = find.byKey(const Key('upiCode'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));
    await tester.enterText(upiCodeField, 'someuser@apl');

    // Test Results
    expect(upiCodeField,findsOneWidget);
  });

    testWidgets(
        'Deposit button is showing correctly or not, after clicking continue twice', (
        WidgetTester tester) async {
      // Get the widget
      final depositButton = find.byKey(
          const Key('deposit'));
      final bankDetailsContinueState1Button = find.byKey(const Key('bankDetailsContinueState1'));
      final name = find.byKey(const Key('name'));
      final accountNumber = find.byKey(const Key('accNo'));
      final ifscCodeField = find.byKey(const Key('ifscCode'));
      final upiCodeField = find.byKey(const Key('upiCode'));

      // Build the app
      await _pumpWidget(tester);
      await tester.pumpAndSettle();

      await tester.enterText(name, 'User Name');
      await tester.enterText(accountNumber, 'LDPE123456');
      await tester.enterText(ifscCodeField, '12340567890');
      await tester.enterText(upiCodeField, 'someuser@apl');

      await tester.tap(bankDetailsContinueState1Button);
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.tap(bankDetailsContinueState1Button);

      // Test Results
      expect(find.byType(String), 'User Name');
      // expect(depositButton, findsOneWidget);
    });
  }