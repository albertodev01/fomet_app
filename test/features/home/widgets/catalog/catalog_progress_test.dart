import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_progress.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

import '../../../../mock_wrapper.dart';
import '../../../../test_utils.dart';

void main() {
  group('CatalogProgress', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: const MockWrapper(
              child: CatalogProgress(),
            ),
          ),
        );

        expect(find.byType(CatalogProgress), findsOneWidget);
        expect(find.byType(ListenableBuilder), findsOneWidget);
        expect(find.byType(Icon), findsNWidgets(2));
      });
    });

    group('Golden tests', () {
      const value = (code: 'code', description: 'desc');

      testWidgets('CatalogProgress', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(600, 200));

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: const MockWrapper(
              child: CatalogProgress(),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/catalgo_progress_empty.png'),
        );
      });

      testWidgets('CatalogProgress - category', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(600, 200));

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState()..category = value,
            child: const MockWrapper(
              child: CatalogProgress(),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/catalgo_progress_1.png'),
        );
      });

      testWidgets('CatalogProgress - category + variety', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(600, 200));

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState()
              ..category = value
              ..variety = value,
            child: const MockWrapper(
              child: CatalogProgress(),
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/catalgo_progress_2.png'),
        );
      });

      testWidgets(
        'CatalogProgress - category + variety + kind',
        (tester) async {
          await setSurfaceSize(tester: tester, size: const Size(600, 200));

          await tester.pumpWidget(
            InheritedObject<CatalogPageState>(
              object: CatalogPageState()
                ..category = value
                ..variety = value
                ..kind = value,
              child: const MockWrapper(
                child: CatalogProgress(),
              ),
            ),
          );

          await expectLater(
            find.byType(MockWrapper),
            matchesGoldenFile('goldens/catalgo_progress_3.png'),
          );
        },
      );
    });
  });
}
