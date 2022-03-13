import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/utils/auth_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_screen_test.mocks.dart';
import 'mock.dart';

//class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockAuthResult extends Mock implements UserCredential {}

@GenerateMocks([FirebaseAuth])
void main(){

  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('Get Started button is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final getStarted_button = find.byKey(const Key('getStarted_test'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:SignupScreen()));

    // Test Results
    expect(getStarted_button,findsOneWidget);
  });

  testWidgets('Email Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_email = find.byKey(const Key('email'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:SignupScreen()));
    await tester.enterText(textfield_email, 'abc@xyz.com');

    // Test Results
    expect(textfield_email,findsOneWidget);
  });

  testWidgets('Password Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_password = find.byKey(const Key('password'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:SignupScreen()));
    await tester.enterText(textfield_password, 'password123');

    // Test Results
    expect(textfield_password,findsOneWidget);
  });

  testWidgets('Confirm Password Text field is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_confirmPassword = find.byKey(const Key('confirm_password'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:SignupScreen()));
    await tester.enterText(textfield_confirmPassword, 'password123');

    // Test Results
    expect(textfield_confirmPassword,findsOneWidget);
  });

  testWidgets('Error Text is showing correctly or not.', (WidgetTester tester) async {
    // Get the widget
    final textfield_password = find.byKey(const Key('password'));
    final textfield_confirmPassword = find.byKey(const Key('confirm_password'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home:SignupScreen()));
    await tester.enterText(textfield_password, '123abc');
    await tester.enterText(textfield_confirmPassword, '123xyz');
    await tester.pump(const Duration(seconds: 2));

    // Test Results
    expect(find.text('Both passwords must be same.'),findsOneWidget);
  });

  group("SignUp Auth tests", (){
    final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
    final MockAuthResult mockAuthResult = MockAuthResult();
    final Auth auth = Auth(authInstance: mockFirebaseAuth);
    const email = "pratyay2sarkar@gmail.com";
    const password = "abc1234";

    test("Testing correct sign up with email",() async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).thenAnswer((realInvocation) => Future<MockAuthResult>.value(mockAuthResult));
      expect(await auth.signUpWithEmail(email, password),"Success");
    });

    test("Testing if account already exists",() async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).thenAnswer((realInvocation) => throw FirebaseAuthException(code: 'email-already-in-use'));
      expect(await auth.signUpWithEmail(email, password),"email-already-in-use");
    });
  });
}