import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/welcome_screen/content_section.dart';
import 'mock.dart';

void main(){

  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Check whether the "Login with email/phone number" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final email_pass_login_button = find.byKey(const Key("email_password_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(email_pass_login_button,findsOneWidget);
  });

  testWidgets('Check whether the "Login with Google" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final google_login_button = find.byKey(const Key("google_login_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(google_login_button,findsOneWidget);
  });

  testWidgets('Check whether the "Login with Facebook" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final facebook_login_button = find.byKey(const Key("facebook_login_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(facebook_login_button,findsOneWidget);
  });

  testWidgets('Check whether the "Create Account" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final create_account_button = find.byKey(const Key("create_account_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(create_account_button,findsOneWidget);
  });
}