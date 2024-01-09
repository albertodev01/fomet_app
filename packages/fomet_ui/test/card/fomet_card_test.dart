import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../mock_wrapper.dart';
import '../test_utils.dart';

void main() {
  group('FometCard', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometCard(
              content: const Text('hi'),
              secondaryContent: const Text('secondary'),
              onTap: () {},
            ),
          ),
        );

        expect(find.byType(FometCard), findsOneWidget);
        expect(find.byType(Card), findsOneWidget);
        expect(find.text('hi'), findsOneWidget);
        expect(find.text('secondary'), findsOneWidget);
      });

      testWidgets('Tap callback', (tester) async {
        var tapped = false;

        await tester.pumpWidget(
          MockWrapper(
            child: FometCard(
              content: const Text('hi'),
              onTap: () => tapped = true,
            ),
          ),
        );

        expect(tapped, isFalse);

        await tester.tap(find.byType(FometCard));
        await tester.pump();

        expect(tapped, isTrue);
      });
    });

    group('Golden tests', () {
      testWidgets('Card', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(300, 150));

        await tester.pumpWidget(
          MockWrapper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FometCard(
                  content: const Text('primary'),
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                FometCard(
                  content: const Text('primary'),
                  trailingIcon: const Text('a'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );

        await expectLater(
          find.byType(Column).first,
          matchesGoldenFile('goldens/fomet_card.png'),
        );
      });

      testWidgets('Card -  secondary content', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(300, 200));

        await tester.pumpWidget(
          MockWrapper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FometCard(
                  content: const Text('primary'),
                  secondaryContent: const Text('secondary'),
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                FometCard(
                  content: const Text('primary'),
                  trailingIcon: const Text('a'),
                  secondaryContent: const Text('secondary'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );

        await expectLater(
          find.byType(Column).first,
          matchesGoldenFile('goldens/fomet_card_secondary.png'),
        );
      });

      testWidgets('Card -  centere items', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(300, 400));

        await tester.pumpWidget(
          MockWrapper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FometCard(
                  content: const Text('primary'),
                  onTap: () {},
                  centerContents: true,
                ),
                const SizedBox(height: 8),
                FometCard(
                  content: const Text('primary'),
                  trailingIcon: const Text('a'),
                  onTap: () {},
                  centerContents: true,
                ),
                const SizedBox(height: 8),
                FometCard(
                  content: const Text('primary'),
                  secondaryContent: const Text('secondary'),
                  onTap: () {},
                  centerContents: true,
                ),
                const SizedBox(height: 8),
                FometCard(
                  content: const Text('primary'),
                  trailingIcon: const Text('a'),
                  secondaryContent: const Text('secondary'),
                  onTap: () {},
                  centerContents: true,
                ),
              ],
            ),
          ),
        );

        await expectLater(
          find.byType(Column).first,
          matchesGoldenFile('goldens/fomet_card_centered.png'),
        );
      });
    });
  });
}
