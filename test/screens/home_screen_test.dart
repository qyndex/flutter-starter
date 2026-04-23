import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/screens/home_screen.dart';

void main() {
  group('HomeScreen', () {
    Widget createHomeScreen() {
      return const MaterialApp(
        home: HomeScreen(),
      );
    }

    testWidgets('renders AppBar with title "Home"', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('renders welcome card with heading and description',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.text('Welcome'), findsOneWidget);
      expect(
        find.textContaining('Material 3 Flutter starter template'),
        findsOneWidget,
      );
    });

    testWidgets('renders welcome card inside a Card widget', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('renders "Get Started" FilledButton', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
    });

    testWidgets('Get Started button is tappable without error', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Tap should not throw — the onPressed is a no-op
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();
    });

    testWidgets('uses ListView for scrollable content', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
