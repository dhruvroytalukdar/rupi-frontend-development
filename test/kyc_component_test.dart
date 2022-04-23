import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/kyc_component/kyc_component.dart';

void main() {
  testWidgets('KYC State 1 Continue button is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final kycContinueState1Button = find.byKey(const Key('kycContinueState1'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home: KYC_Component()));

    // Test Results
    expect(kycContinueState1Button, findsOneWidget);
  });

  testWidgets('PAN Number Text field is showing correctly or not.',
      (WidgetTester tester) async {
    // Get the widget
    final textfieldPAN = find.byKey(const Key('panField'));

    // Start the app for testing
    await tester.pumpWidget(const MaterialApp(home: KYC_Component()));
    await tester.enterText(textfieldPAN, 'LDPE123456');

    // Test Results
    expect(textfieldPAN, findsOneWidget);
  });

  // testWidgets('KYC State 2 Confirm button is showing correctly or not.',
  //         (WidgetTester tester) async {
  //       // Get the widget
  //       final kycContinueState1Button = find.byKey(const Key('kycContinueState1'));
  //       final kycNameConfirmButton = find.byKey(const Key('kycNameConfirm'));
  //
  //       // Start the app for testing
  //       await tester.pumpWidget(const MaterialApp(home: KYC_Component()));
  //       await tester.tap(kycContinueState1Button);
  //       // Rebuild the widget after the state has changed.
  //       await tester.pump();
  //
  //       // Test Results
  //       expect('thisName asPerPAN', findsOneWidget);
  //     });
}
