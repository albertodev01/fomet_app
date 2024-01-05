import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';

import '../../mock_wrapper.dart';

void main() {
  group('CenteredScrollableContent', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: CenteredScrollableContent(
              children: [Text('test')],
            ),
          ),
        );

        expect(find.byType(CenteredScrollableContent), findsOneWidget);
        expect(find.byType(CustomScrollView), findsOneWidget);
        expect(find.byType(SliverFillRemaining), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('CenteredScrollableContent', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _GoldenContainer(
                    children: [
                      Text('a'),
                      Text('b'),
                    ],
                  ),
                  SizedBox(width: 16),
                  _GoldenContainer(
                    children: [
                      Text('a'),
                      Text('b'),
                      Text('c'),
                      Text('d'),
                      Text('e'),
                      Text('f'),
                      Text('g'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/centered_scrollable_content.png'),
        );
      });
    });
  });
}

class _GoldenContainer extends StatelessWidget {
  final List<Widget> children;
  const _GoldenContainer({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: CenteredScrollableContent(
        children: children,
      ),
    );
  }
}
