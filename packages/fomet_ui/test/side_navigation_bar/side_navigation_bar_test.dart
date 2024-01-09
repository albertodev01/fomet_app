import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/side_navigation_bar/widget/side_navigation_item.dart';

import '../mock_wrapper.dart';

void main() {
  group('FometSideNavigationBar', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometSideNavigationBar(
              onItemTap: (_) {},
              selectedIndex: ValueNotifier<int>(0),
              sidebarLeadingIcon: const Text('leading'),
              items: const [
                (iconData: Icons.abc, text: 'one'),
                (iconData: Icons.access_alarm, text: 'two'),
              ],
              child: const Text('child'),
            ),
          ),
        );

        expect(find.byType(FometSideNavigationBar), findsOneWidget);
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.byType(SideNavigationItem), findsNWidgets(2));
        expect(find.text('leading'), findsOneWidget);
        expect(find.text('child'), findsOneWidget);
        expect(find.text('one'), findsOneWidget);
        expect(find.text('two'), findsOneWidget);
      });

      testWidgets('Item tap callback', (tester) async {
        var itemIndex = 0;
        final notifier = ValueNotifier<int>(0);

        await tester.pumpWidget(
          MockWrapper(
            child: FometSideNavigationBar(
              onItemTap: (item) => itemIndex = item,
              selectedIndex: notifier,
              sidebarLeadingIcon: const Text('leading'),
              items: const [
                (iconData: Icons.abc, text: 'one'),
                (iconData: Icons.access_alarm, text: 'two'),
              ],
              child: const Text('child'),
            ),
          ),
        );

        await tester.tap(find.text('two'));
        await tester.pump();

        expect(itemIndex, equals(1));
        expect(notifier.value, equals(1));

        await tester.tap(find.text('one'));
        await tester.pump();

        expect(itemIndex, isZero);
        expect(notifier.value, isZero);
      });

      testWidgets('didUpdateWidget test', (tester) async {
        var items = const [
          (iconData: Icons.abc, text: 'one'),
          (iconData: Icons.access_alarm, text: 'two'),
        ];

        await tester.pumpWidget(
          MockWrapper(
            child: StatefulBuilder(
              builder: (context, setState) {
                return FometSideNavigationBar(
                  onItemTap: (_) {},
                  selectedIndex: ValueNotifier<int>(0),
                  sidebarLeadingIcon: const Text('leading'),
                  items: items,
                  child: FometButton(
                    onTap: () {
                      setState(() {
                        items = const [
                          (iconData: Icons.abc_outlined, text: 'one'),
                          (iconData: Icons.access_alarm, text: 'two'),
                          (iconData: Icons.egg_rounded, text: 'three'),
                        ];
                      });
                    },
                    text: 'Tap',
                  ),
                );
              },
            ),
          ),
        );

        expect(find.byType(SideNavigationItem), findsNWidgets(2));

        await tester.tap(find.byType(FometButton));
        await tester.pumpAndSettle();

        expect(find.byType(SideNavigationItem), findsNWidgets(3));
      });
    });

    group('Golden tests', () {
      testWidgets('FometSideNavigationBar', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometSideNavigationBar(
              onItemTap: (_) {},
              selectedIndex: ValueNotifier<int>(0),
              sidebarLeadingIcon: const Text('leading'),
              sidebarTrailingIcon: const Text('trailing'),
              items: const [
                (iconData: Icons.abc, text: 'one'),
                (iconData: Icons.access_alarm, text: 'two'),
              ],
              child: const Center(
                child: Text('child'),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/side_navigation_bar.png'),
        );
      });

      testWidgets('FometBottomNavigationBar - second item tap', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometSideNavigationBar(
              onItemTap: (_) {},
              selectedIndex: ValueNotifier<int>(0),
              sidebarLeadingIcon: const Text('leading'),
              items: const [
                (iconData: Icons.abc, text: 'one'),
                (iconData: Icons.access_alarm, text: 'two'),
              ],
              child: const Center(
                child: Text('child'),
              ),
            ),
          ),
        );

        await tester.tap(find.text('two'));
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/side_navigation_bar_2.png'),
        );
      });
    });
  });
}
