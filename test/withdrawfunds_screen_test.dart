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
          child: const WithDrawFundsScreen(),
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
  });
}
