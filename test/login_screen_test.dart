import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/utils/auth_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_screen_test.mocks.dart';
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

  group("Login Auth tests", (){
    final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
    final MockAuthResult mockAuthResult = MockAuthResult();
    final Auth auth = Auth(authInstance: mockFirebaseAuth);
    const email = "abc@example.com";
    const password = "abc1234";

    test("testing correct sign in with email",() async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password)).thenAnswer((realInvocation) => Future<MockAuthResult>.value(mockAuthResult));
      expect(await auth.signInWithEmail(email, password),"Success");
    });

    test("testing incorrect password sign in",() async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: "abc123")).thenAnswer((realInvocation) => throw FirebaseAuthException(code: 'wrong-password'));
      expect(await auth.signInWithEmail(email, "abc123"),"wrong-password");
    });

    test("testing incorrect email sign in",() async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: "abc@xyz.com", password: password)).thenAnswer((realInvocation) => throw FirebaseAuthException(code: 'user-does-not-exist'));
      expect(await auth.signInWithEmail("abc@xyz.com", password),"user-does-not-exist");
    });
  });
}