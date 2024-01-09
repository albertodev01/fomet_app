import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/no_products_found.dart';

import '../../mock_wrapper.dart';

void main() {
  group('NoProductsFound', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: NoProductsFound(),
          ),
        );

        expect(find.byType(NoProductsFound), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('NoProductsFound', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: NoProductsFound(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/no_products_found.png'),
        );
      });
    });
  });
}
