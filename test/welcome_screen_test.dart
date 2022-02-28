import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/welcome_screen/content_section.dart';

void main(){
  testWidgets('Welcome text widget are showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final welcomeText = find.text("Welcome");

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(welcomeText,findsOneWidget);
  });
}