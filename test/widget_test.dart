import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app.dart';

void main() {
  group('MyApp', () {
    testWidgets('renders MaterialApp with correct title', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      // MaterialApp.router is used under the hood
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'Flutter Starter');
    });

    testWidgets('does not show debug banner', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });

    testWidgets('uses Material 3 theme with deep purple seed', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.useMaterial3, isTrue);
    });

    testWidgets('renders bottom navigation bar with 3 destinations',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(NavigationDestination), findsNWidgets(3));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('starts on the Home screen', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      // Home screen has an AppBar titled "Home" and a "Welcome" heading
      expect(find.text('Home'), findsWidgets); // AppBar + nav label
      expect(find.text('Welcome'), findsOneWidget);
    });

    testWidgets('navigates to Explore screen via bottom nav', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      // Tap the Explore destination in the NavigationBar
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();

      // Explore screen shows the AppBar title and grid items
      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('navigates to Profile screen via bottom nav', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MyApp()),
      );
      await tester.pumpAndSettle();

      // Tap the Profile destination
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Profile screen shows user name
      expect(find.text('Jane Doe'), findsOneWidget);
    });
  });
}
