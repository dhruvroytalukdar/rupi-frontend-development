import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/holdings_card.dart';
import 'package:frontend/components/home_screen/more_card.dart';
import 'package:frontend/components/home_screen/support_card.dart';
import 'package:frontend/screens/home_screen.dart';
import 'mock.dart';

void main(){

  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Check whether the "Deposit" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final depositButtonTest = find.byKey(const Key("depositButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:Holdings()));

    // Test Results
    expect(depositButtonTest,findsOneWidget);
  });

  testWidgets('Check whether the "Withdraw" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final withdrawButtonTest = find.byKey(const Key("withdrawButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:Holdings()));

    // Test Results
    expect(withdrawButtonTest,findsOneWidget);
  });

  testWidgets('Check whether the "Talk Now" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final talkNowButtonTest = find.byKey(const Key("talkNowButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:Support()));

    // Test Results
    expect(talkNowButtonTest,findsOneWidget);
  });

  testWidgets('Check whether the "WhatsApp Icon" loads correctly', (WidgetTester tester) async {
    // Get the widget
    final whatsappIconTest = find.byKey(const Key("whatsappIcon"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:Support()));

    // Test Results
    expect(whatsappIconTest,findsOneWidget);
  });

  testWidgets('Check whether the "FAQs" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final FAQButtonTest = find.byKey(const Key("FAQButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:More()));

    // Test Results
    expect(FAQButtonTest,findsOneWidget);
  });

  testWidgets('Check whether the "Settings" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final settingsButtonTest = find.byKey(const Key("settingsButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:More()));

    // Test Results
    expect(settingsButtonTest,findsOneWidget);
  });

  testWidgets('Check whether the "About" button loads correctly', (WidgetTester tester) async {
    // Get the widget
    final aboutButtonTest = find.byKey(const Key("aboutButton"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:More()));

    // Test Results
    expect(aboutButtonTest,findsOneWidget);
  });
}