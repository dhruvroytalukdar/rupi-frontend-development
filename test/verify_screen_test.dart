import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/verify_screen.dart';
import 'mock.dart';

void main(){

  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Check whether the change email button loaded correctly', (WidgetTester tester) async {
    // Get the widget
    final button = find.byKey(const Key("change_email_button_on_verify_screen"));

    // Execute the tests
    await tester.pumpWidget(const MaterialApp(home:VerifyScreen()));

    // Test Results
    expect(button,findsOneWidget);
  });
}