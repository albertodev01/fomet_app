import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_progress.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('CatalogPage', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: const MockWrapper(
              child: CatalogPage(),
            ),
          ),
        );

        expect(find.byType(CatalogPage), findsOneWidget);
        expect(find.byType(PageView), findsOneWidget);
        expect(find.byType(Divider), findsOneWidget);
        expect(find.byType(CatalogProgress), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('CatalogPage', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: const MockWrapper(
              child: CatalogPage(),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/catalog_page.png'),
        );
      });
    });
  });
}
