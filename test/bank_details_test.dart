import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/bank_details_component.dart';

void main(){

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

  testWidgets('IFSC Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final upiCodeField = find.byKey(const Key('upiCode'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:BankDetailsComponent()));
    await tester.enterText(upiCodeField, 'someuser@apl');

    // Test Results
    expect(upiCodeField,findsOneWidget);
  });
}