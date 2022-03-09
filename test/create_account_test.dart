import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/create_account_screen/content_section.dart';
import 'mock.dart';

void main(){

  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Check whether the "SignUp with email/phone number" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final email_pass_signup_button = find.byKey(const Key("email_password_signup_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(email_pass_signup_button,findsOneWidget);
  });

  testWidgets('Check whether the "SignUp with Google" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final google_signup_button = find.byKey(const Key("google_signup_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(google_signup_button,findsOneWidget);
  });

  testWidgets('Check whether the "SignUp with Facebook" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final facebook_signup_button = find.byKey(const Key("facebook_signup_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(facebook_signup_button,findsOneWidget);
  });

  testWidgets('Check whether the "Login" button is loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final already_have_account_button = find.byKey(const Key("already_have_account_button"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:ContentSection()));

    // Test Results
    expect(already_have_account_button,findsOneWidget);
  });
}