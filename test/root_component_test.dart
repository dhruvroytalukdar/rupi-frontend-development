import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/holding_section.dart';
import 'package:frontend/components/home_screen/root_component.dart';
import 'package:frontend/components/home_screen/transaction_section.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'mock.dart';

void main() {
  User _user = User(
    email: "dhruv@lazer.com",
    fullName: "Dhruv Roy",
    phoneNumber: "+919876543210",
    currentBalance: 0,
  );

  setupCloudFirestoreMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  _pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(_user),
          child: RootComponent(),
        ),
      ),
    );
  }

  group("Check if logged in User's value is displayed correctly or not", () {
    testWidgets(
        "Check if the users current balance is showing correctly or not.",
        (WidgetTester tester) async {
      // Get the widget
      final currentValueText = find.byKey(const Key("user_current_value"));

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      expect(currentValueText, findsOneWidget);
      Text currentBalance = tester.firstWidget(currentValueText);
      expect(currentBalance.data, "6000");
    });
  });

  group("UI checks", () {
    testWidgets("Check if the drawer component is showing correctly or not.",
        (WidgetTester tester) async {
      final drawerIcon = find.ancestor(
          of: find.byIcon(Icons.menu),
          matching: find.byWidgetPredicate((widget) => widget is IconButton));

      await _pumpWidget(tester);

      expect(drawerIcon, findsOneWidget);

      await tester.tap(drawerIcon);
      await tester.pump();

      expect(find.byType(Drawer), findsOneWidget);
    });

    testWidgets("Check if holdings card is showing correctly or not.",
        (WidgetTester tester) async {
      final holdingCard = find.byType(HoldingSection);

      await _pumpWidget(tester);

      expect(holdingCard, findsOneWidget);
    });

    testWidgets("Check if the transaction card is showing correctly or not.",
        (WidgetTester tester) async {
      final transactionCard = find.byType(TransactionSection);

      await _pumpWidget(tester);

      expect(transactionCard, findsOneWidget);
    });
  });
}
