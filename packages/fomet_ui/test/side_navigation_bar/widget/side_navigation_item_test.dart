import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/src/side_navigation_bar/widget/side_navigation_item.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('SideNavigationItem', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: SideNavigationItem(
              index: 0,
              selectedIndex: ValueNotifier<int>(0),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        expect(find.byType(SideNavigationItem), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
        expect(find.text('Text'), findsOneWidget);
        expect(find.byType(ValueListenableBuilder<int>), findsNWidgets(2));
      });
    });

    group('Golden test', () {
      testWidgets('SideNavigationItem - deselected', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(250, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: SideNavigationItem(
              index: 0,
              selectedIndex: ValueNotifier<int>(1),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/side_navigation_item_deselected.png'),
        );
      });

      testWidgets('SideNavigationItem - selected', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(250, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: SideNavigationItem(
              index: 1,
              selectedIndex: ValueNotifier<int>(1),
              text: 'Text',
              iconData: Icons.ac_unit,
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/side_navigation_item_selected.png'),
        );
      });
    });
  });
}
