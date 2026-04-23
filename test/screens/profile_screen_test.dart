import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/screens/profile_screen.dart';

void main() {
  group('ProfileScreen', () {
    Widget createProfileScreen() {
      return const MaterialApp(
        home: ProfileScreen(),
      );
    }

    testWidgets('renders AppBar with title "Profile"', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('renders CircleAvatar with person icon', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byIcon(Icons.person), findsWidgets);
    });

    testWidgets('displays user name and email', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.text('Jane Doe'), findsOneWidget);
      expect(find.text('jane@example.com'), findsOneWidget);
    });

    testWidgets('renders Settings menu item', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.text('Settings'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('renders Help & Support menu item', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.text('Help & Support'), findsOneWidget);
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
    });

    testWidgets('renders Sign Out menu item', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.text('Sign Out'), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });

    testWidgets('renders a Divider between user info and menu items',
        (tester) async {
      await tester.pumpWidget(createProfileScreen());

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('menu items are ListTile widgets', (tester) async {
      await tester.pumpWidget(createProfileScreen());

      // 3 ListTiles: Settings, Help & Support, Sign Out
      expect(find.byType(ListTile), findsNWidgets(3));
    });
  });
}
