import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/screens/login_screen.dart';

void main(){
  testWidgets('Continue button is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final continue_button = find.byKey(const Key('continue_test'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));

    // Test Results
    expect(continue_button,findsOneWidget);
  });

  testWidgets('Email Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_email = find.byKey(const Key('email'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));
    await tester.enterText(textfield_email, 'abc@xyz.com');

    // Test Results
    expect(textfield_email,findsOneWidget);
  });

  testWidgets('Password Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_password = find.byKey(const Key('password'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));
    await tester.enterText(textfield_password, 'password123');

    // Test Results
    expect(textfield_password,findsOneWidget);
  });

  testWidgets('Given password and email, checking if sign-in is working or not.', (WidgetTester tester) async {

    // Get the widget
    final textfield_email = find.byKey(const Key('email'));
    final textfield_password = find.byKey(const Key('password'));
    final continue_button = find.byKey(const Key('continue_test'));

    // Start the app for testing (building app in test environment)
    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));

    //Emulating user action
    await tester.enterText(textfield_email, 'abc@example.com');
    await tester.enterText(textfield_password, 'abc1234');
    await tester.tap(continue_button);

    //Updating the state
    await tester.pump(const Duration(seconds: 2));

    // Test Results
    expect(find.text('Home abc@example.com'),findsOneWidget);
  });
}