import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/src/bottom_navigation_bar/widget/bottom_navigation_item.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('BottomNavigationItem', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: BottomNavigationItem(
              index: 0,
              selectedIndex: ValueNotifier<int>(0),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        expect(find.byType(BottomNavigationItem), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
        expect(find.text('Text'), findsOneWidget);
        expect(find.byType(ValueListenableBuilder<int>), findsOneWidget);
      });
    });

    group('Golden test', () {
      testWidgets('BottomNavigationItem - deselected', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(100, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: BottomNavigationItem(
              index: 0,
              selectedIndex: ValueNotifier<int>(1),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/bottom_navigation_item_deselected.png'),
        );
      });

      testWidgets('BottomNavigationItem - selected', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(100, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: BottomNavigationItem(
              index: 1,
              selectedIndex: ValueNotifier<int>(1),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/bottom_navigation_item_selected.png'),
        );
      });
    });
  });
}
