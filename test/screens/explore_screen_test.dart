import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/screens/explore_screen.dart';

void main() {
  group('ExploreScreen', () {
    Widget createExploreScreen() {
      return const MaterialApp(
        home: ExploreScreen(),
      );
    }

    testWidgets('renders AppBar with title "Explore"', (tester) async {
      await tester.pumpWidget(createExploreScreen());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('renders a GridView', (tester) async {
      await tester.pumpWidget(createExploreScreen());

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('renders Card items with image icons', (tester) async {
      await tester.pumpWidget(createExploreScreen());

      // At least some cards should be visible (grid with 12 items)
      expect(find.byType(Card), findsWidgets);
      expect(find.byIcon(Icons.image), findsWidgets);
    });

    testWidgets('renders items with sequential labels', (tester) async {
      await tester.pumpWidget(createExploreScreen());

      // First visible items in the grid
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('grid has 2 columns (cross axis count)', (tester) async {
      await tester.pumpWidget(createExploreScreen());

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 2);
    });
  });
}
