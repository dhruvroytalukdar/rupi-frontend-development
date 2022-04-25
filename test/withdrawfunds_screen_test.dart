import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/screens/withdraw_funds_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'mock.dart';

void main() {
  // Mocks to use firebase in testing environemts
  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "₹");
  const screenObject = WithDrawFundsScreen();

  // Utility function to load the screen in a material app
  _pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider(testUser)),
            ChangeNotifierProvider(
              create: (_) => UserStatusProvider(true, false, false, false),
            ),
          ],
          child: screenObject,
        ),
      ),
    );
  }

  group('UI tests', () {
    testWidgets("Check if the user balance is showing correctly or not.",
        (WidgetTester tester) async {
      final text = find.text(formatCurrency.format(testUser.currentBalance));
      await _pumpWidget(tester);
      expect(text, findsOneWidget);
    });

    testWidgets("Check if the balance textfield is showing correctly or not",
        (WidgetTester tester) async {
      final textField = find.byKey(const Key("withdrawfund_field"));
      await _pumpWidget(tester);
      expect(textField, findsOneWidget);
    });

    testWidgets("Check if the balance textfield only takes numbers.",
        (WidgetTester tester) async {
      final textField = find.byKey(const Key("withdrawfund_field"));
      await _pumpWidget(tester);
      expect(textField, findsOneWidget);

      // Enter alphanumeric characters
      await tester.enterText(find.byType(TextField), "123.63");
      expect(find.text("123.63"), findsOneWidget);
    });

    testWidgets("Check if the amount tabs are working correctly or not.",
        (WidgetTester tester) async {
      final percent25Tab = find.byKey(const Key("25%_key"));
      final percent50Tab = find.byKey(const Key("50%_key"));
      final percent75Tab = find.byKey(const Key("75%_key"));
      final percent100Tab = find.byKey(const Key("100%_key"));

      await _pumpWidget(tester);
      expect(percent25Tab, findsOneWidget);
      expect(percent50Tab, findsOneWidget);
      expect(percent75Tab, findsOneWidget);
      expect(percent100Tab, findsOneWidget);

      await tester.tap(percent25Tab);
      await tester.pump();

      expect(find.text("1500.0"), findsOneWidget);

      await tester.tap(percent50Tab);
      await tester.pump();

      expect(find.text("3000.0"), findsOneWidget);

      await tester.tap(percent75Tab);
      await tester.pump();

      expect(find.text("4500.0"), findsOneWidget);

      await tester.tap(percent100Tab);
      await tester.pump();

      expect(find.text("6000.0"), findsOneWidget);
    });

    testWidgets(
        "Check if the amount tab background changes after user taps the textfield.",
        (WidgetTester tester) async {
      final percent25Tab = find.byKey(const Key("25%_key"));
      final textField = find.byKey(const Key("withdrawfund_field"));

      await _pumpWidget(tester);
      await tester.tap(percent25Tab);
      await tester.pump();

      expect(
        ((tester.firstWidget(find.text("25%")) as Text).style)!.color,
        Colors.white,
      );

      await tester.enterText(textField, "1234");
      await tester.pump();

      expect(
        ((tester.firstWidget(find.text("25%")) as Text).style)!.color,
        Colors.black,
      );
    });

    testWidgets("Check if the drop down menu appears or not.",
        (WidgetTester tester) async {
      final widget = find.byKey(const Key("withdraw_upi_drop_down"));

      await _pumpWidget(tester);

      expect(widget, findsOneWidget);
    });

    testWidgets("Check if continue button loading correctly or not.",
        (WidgetTester tester) async {
      final widget = find.byKey(const Key("withdraw_money_continue_button"));

      await _pumpWidget(tester);

      expect(widget, findsOneWidget);
    });
  });
}
