import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/about/widgets/list_entry_item.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('ListEntryItem', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ListEntryItem(
              value: 1,
              text: Text('test'),
            ),
          ),
        );

        expect(find.byType(ListEntryItem), findsOneWidget);
        expect(find.text('test'), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('ListEntryItem', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListEntryItem(
                  value: 1,
                  text: Text('Text goes here'),
                ),
                SizedBox(height: 8),
                ListEntryItem(
                  value: 2,
                  text: Text(
                    'Text goes here Text goes here Text goes here '
                    'Text goes here Text goes here Text goes here Text goes '
                    'here Text goes here Text goes here Text goes here',
                  ),
                ),
              ],
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/list_entry_item.png'),
        );
      });
    });
  });
}
