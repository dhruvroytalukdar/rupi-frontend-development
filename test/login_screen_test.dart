import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
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
}