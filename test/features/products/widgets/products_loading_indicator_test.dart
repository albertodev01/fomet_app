import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/products/widgets/products_loading_widget.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('ProductsLoadingIndicator', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ProductsLoadingIndicator(),
          ),
        );

        expect(find.byType(ProductsLoadingIndicator), findsOneWidget);
        expect(find.byType(CenteredScrollableContent), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('ProductsLoadingIndicator', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ProductsLoadingIndicator(),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/products_loading_indicator.png'),
        );
      });
    });
  });
}
