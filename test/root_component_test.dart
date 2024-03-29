import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/home_screen/drawer_component/drawer_footer.dart';
import 'package:frontend/components/home_screen/holding_component/holding_section.dart';
import 'package:frontend/components/home_screen/holding_component/holding_transaction_wrapper.dart';
import 'package:frontend/components/home_screen/root_component.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_item.dart';
import 'package:frontend/components/home_screen/transaction_component/transaction_section.dart';
import 'package:frontend/constants/index.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/user_status_provider.dart';
import 'package:frontend/utils/transaction_list_utils.dart';
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
          child: const RootComponent(),
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
      final formatCurrency =
          NumberFormat.currency(locale: "en_US", symbol: "₹");

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      expect(currentValueText, findsOneWidget);
      Text currentBalance = tester.firstWidget(currentValueText);
      expect(
          currentBalance.data, formatCurrency.format(testUser.currentBalance));
    });

    testWidgets("Check if the total returns is showing correctly or not",
        (WidgetTester tester) async {
      // Get the widget/utility classes
      final totalReturnsText = find.byKey(const Key("user_total_returns"));
      final formatCurrency =
          NumberFormat.currency(locale: "en_US", symbol: "₹");

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      expect(totalReturnsText, findsOneWidget);
      Text totalReturns = tester.firstWidget(totalReturnsText);
      expect(totalReturns.data, formatCurrency.format(testUser.totalReturns));
    });

    testWidgets("Check if the invested amount is showing correctly or not",
        (WidgetTester tester) async {
      // Get the widget/utility classes
      final investedAmountText = find.byKey(const Key("user_invested_money"));
      final formatCurrency =
          NumberFormat.currency(locale: "en_US", symbol: "₹");

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      expect(investedAmountText, findsOneWidget);
      Text investedAmount = tester.firstWidget(investedAmountText);
      expect(
          investedAmount.data, formatCurrency.format(testUser.investedAmount));
    });

    testWidgets("Check if the current date is showing correctly or not.",
        (WidgetTester tester) async {
      // Get the widget
      final currentDateWidget = find.byKey(const Key("current_date"));

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      expect(currentDateWidget, findsOneWidget);
      Text currentDate = tester.firstWidget(currentDateWidget);
      expect(currentDate.data,
          "as of ${DateFormat.yMMMMd('en_US').format(DateTime.now())}");
    });

    testWidgets("Check for the transaction history",
        (WidgetTester tester) async {
      // Get the widget
      // final currentDateWidget = find.byKey(const Key("current_date"));
      final transactionList = convertToMap(testUser.transactionList, []);

      // Build the app
      await _pumpWidget(tester);

      // Test the app
      // Check if number of transactions equals to number of TransactionItem components.
      expect(find.byType(TransactionItem),
          findsNWidgets(testUser.transactionList.length));
      // Check if convertToMap function works correctly or not.
      // The test user made all transactions on two days so there should be two date fields
      expect(find.byKey(const Key("transaction_dates")),
          findsNWidgets(transactionList.keys.length));
    });
  });

  group("UI checks", () {
    testWidgets("Check if FloatingActionButton is showing correctly or not.",
        (WidgetTester tester) async {
      await _pumpWidget(tester);

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

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

    testWidgets("Check if the drawer component closing correctly or not.",
        (WidgetTester tester) async {
      // Step 1. Open the drawer and expect to find a component of Drawer type
      // Step 2. Close the drawer and expect no component of Drawer type.

      final drawerIcon = find.ancestor(
          of: find.byIcon(Icons.menu),
          matching: find.byWidgetPredicate((widget) => widget is IconButton));
      final drawerCloseButton = find.byKey(const Key("drawer_close_button"));

      await _pumpWidget(tester);

      expect(drawerIcon, findsOneWidget);

      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsOneWidget);

      await tester.tap(drawerCloseButton);
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsNothing);
    });

    testWidgets("Check if the five fields appears correctly in the drawer.",
        (WidgetTester tester) async {
      final drawerIcon = find.ancestor(
          of: find.byIcon(Icons.menu),
          matching: find.byWidgetPredicate((widget) => widget is IconButton));

      await _pumpWidget(tester);

      expect(drawerIcon, findsOneWidget);

      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsOneWidget);
      expect(find.byKey(const Key("drawer_list_items")), findsNWidgets(5));
    });

    testWidgets("Check if the drawer footer appears correctly or not.",
        (WidgetTester tester) async {
      final drawerIcon = find.ancestor(
          of: find.byIcon(Icons.menu),
          matching: find.byWidgetPredicate((widget) => widget is IconButton));

      await _pumpWidget(tester);

      expect(drawerIcon, findsOneWidget);

      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();

      expect(find.byType(DrawerFooter), findsOneWidget);

      // Checking if the text button appears or not.
      final textButton = find.descendant(
          of: find.byType(DrawerFooter), matching: find.byType(TextButton));
      expect(textButton, findsOneWidget);
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

    testWidgets(
        "Check if holdings and transaction cards are the first thing rendered in the home screen.",
        (WidgetTester tester) async {
      final wrapperWidget = find.byType(HoldingTransactionWrapper);

      await _pumpWidget(tester);

      expect(wrapperWidget, findsOneWidget);
    });
  });
}
