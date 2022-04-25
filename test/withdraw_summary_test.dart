import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/withdraw_summary/payment_complete_section.dart';
import 'package:frontend/components/withdraw_summary/summary_section.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/providers/withdraw_state_provider.dart';
import 'package:frontend/screens/withdraw_summary_screen.dart';
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
  const screenObject =
      WithdrawSummaryScreen(amount: "6000", upiId: "1234@abcde");

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
            ChangeNotifierProvider(
              create: (_) => WithdrawStatusProvider(false, false, false),
            ),
          ],
          child: screenObject,
        ),
      ),
    );
  }

  group('UI tests', () {
    testWidgets("Check if summary section loaded correctly or not",
        (WidgetTester tester) async {
      final widget = find.byType(SummarySection);

      await _pumpWidget(tester);

      expect(widget, findsOneWidget);
    });

    testWidgets("Check if withdraw amount and upi id loaded correctly or not",
        (WidgetTester tester) async {
      await _pumpWidget(tester);

      expect(find.text(formatCurrency.format(6000)), findsOneWidget);
      expect(find.text("1234@abcde"), findsOneWidget);
    });

    testWidgets("Check if cancel and confirm buttons loaded correctly or not",
        (WidgetTester tester) async {
      await _pumpWidget(tester);

      expect(find.byKey(const Key("withdraw_confirm_button")), findsOneWidget);
      expect(find.byKey(const Key("withdraw_cancel_button")), findsOneWidget);
    });

    testWidgets("Check if confirm button work correctly or not",
        (WidgetTester tester) async {
      await _pumpWidget(tester);

      await tester.tap(find.byKey(const Key("withdraw_confirm_button")));
      await tester.pump();

      expect(find.byType(PaymentCompleteSection), findsOneWidget);
    });

    testWidgets("Check if cancel button work correctly or not",
        (WidgetTester tester) async {
      await _pumpWidget(tester);

      await tester.tap(find.byKey(const Key("withdraw_cancel_button")));
      await tester.pump();

      expect(find.byType(WithdrawSummaryScreen), findsOneWidget);
    });
  });
}
