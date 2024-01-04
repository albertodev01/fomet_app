import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/page_scaffold.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('FometPageScaffold', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: FometPageScaffold(
              child: Text('child'),
            ),
          ),
        );

        expect(find.byType(FometPageScaffold), findsOneWidget);
        expect(find.text('child'), findsOneWidget);

        // MockWrapper + FometPageScaffold
        expect(find.byType(Scaffold), findsNWidgets(2));
      });

      testWidgets('didUpdateWidget - bottom navigation', (tester) async {
        var child = const Text('a');

        await tester.pumpWidget(
          MockWrapper(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    Expanded(
                      child: FometPageScaffold(
                        child: child,
                      ),
                    ),
                    FometButton(
                      onTap: () => setState(() => child = const Text('b')),
                      text: 'Button',
                    ),
                  ],
                );
              },
            ),
          ),
        );

        expect(find.text('a'), findsOneWidget);
        expect(find.text('b'), findsNothing);

        await tester.tap(find.byType(FometButton));
        await tester.pumpAndSettle();

        expect(find.text('b'), findsOneWidget);
        expect(find.text('a'), findsNothing);
      });

      testWidgets('didUpdateWidget - side navigation', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(1200, 800));

        var child = const Text('a');

        await tester.pumpWidget(
          MockWrapper(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    Expanded(
                      child: FometPageScaffold(
                        child: child,
                      ),
                    ),
                    FometButton(
                      onTap: () => setState(() => child = const Text('b')),
                      text: 'Button',
                    ),
                  ],
                );
              },
            ),
          ),
        );

        expect(find.text('a'), findsOneWidget);
        expect(find.text('b'), findsNothing);

        await tester.tap(find.byType(FometButton));
        await tester.pumpAndSettle();

        expect(find.text('b'), findsOneWidget);
        expect(find.text('a'), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('FometPageScaffold - side navigation', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(1200, 800));

        await tester.pumpWidget(
          const MockWrapper(
            child: FometPageScaffold(
              child: Text('text'),
            ),
          ),
        );

        expect(find.byType(FometSideNavigationBar), findsOneWidget);

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/page_scaffold_side_navigation.png'),
        );
      });

      testWidgets('FometPageScaffold - bottom navigation', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: FometPageScaffold(
              child: Text('text'),
            ),
          ),
        );

        expect(find.byType(FometBottomNavigationBar), findsOneWidget);

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/page_scaffold_bottom_navigation.png'),
        );
      });
    });
  });
}
