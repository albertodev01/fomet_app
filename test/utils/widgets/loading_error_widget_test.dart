import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/loading_error_widget.dart';

import '../../mock_wrapper.dart';

void main() {
  group('LoadingErrorWidget', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: LoadingErrorWidget(),
          ),
        );

        expect(find.byType(LoadingErrorWidget), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(2));
      });
    });

    group('Golden tests', () {
      testWidgets('LoadingErrorWidget', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: LoadingErrorWidget(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/loading_error_widget.png'),
        );
      });
    });
  });
}
