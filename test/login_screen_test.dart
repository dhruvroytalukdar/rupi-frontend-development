import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/login_screen/login_section.dart';

void main(){
  testWidgets('Continue button is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final continue_button = find.text('Login');

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:LoginSection()));

    // Test Results
    expect(continue_button,findsOneWidget);
  });
}