import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/products/widgets/products_result.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('ProductsResult', () {
    const mockResponse = (
      code: 'AKER/BB',
      description: 'AKER ® PELLET BIG BAG DA 500 KG',
      categoryCode: 'ALB',
      categoryDescription: 'Alberi da frutto',
      varietyCode: 'ACT',
      varietyDescription: 'Actinidia',
    );

    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ProductsResult(
              products: [mockResponse],
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProductsResult), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(FometCard), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('ProductsResult', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ProductsResult(
              products: [mockResponse],
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/products_result.png'),
        );
      });
    });
  });
}
