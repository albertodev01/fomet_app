import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/shell_page_wrapper.dart';

import '../../mock_wrapper.dart';

void main() {
  group('ShellPageWrapper', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ShellPageWrapper(child: Text('hi')),
          ),
        );

        expect(find.byType(ShellPageWrapper), findsOneWidget);
        expect(find.byType(ColoredBox), findsOneWidget);
        expect(find.text('hi'), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('Shell wrapper', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ShellPageWrapper(child: Text('hi')),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/shell_page_wrapper.png'),
        );
      });
    });
  });
}
