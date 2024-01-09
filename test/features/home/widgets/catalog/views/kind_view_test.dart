import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/kind_view.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../../../mock_wrapper.dart';

void main() {
  group('KindView', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: KindView(
                controller: PageController(),
              ),
            ),
          ),
        );

        expect(find.byType(KindView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(find.byType(FometCard), findsNWidgets(3));
      });

      testWidgets('Tap on first item', (tester) async {
        final controller = PageController(initialPage: 2);
        final state = CatalogPageState();

        addTearDown(controller.dispose);

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: state,
            child: MockWrapper(
              child: PageView(
                controller: controller,
                children: [
                  const Text('category'),
                  const Text('variety'),
                  KindView(controller: controller),
                  const Text('products'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(KindView), findsOneWidget);

        await tester.tap(find.byType(FometCard).first);
        await tester.pumpAndSettle();

        expect(
          state.kind,
          equals(const (code: '0', description: 'Conventional')),
        );
        expect(find.text('products'), findsOneWidget);
        expect(find.byType(KindView), findsNothing);
      });

      testWidgets('Tap on second item', (tester) async {
        final controller = PageController(initialPage: 2);
        final state = CatalogPageState();

        addTearDown(controller.dispose);

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: state,
            child: MockWrapper(
              child: PageView(
                controller: controller,
                children: [
                  const Text('category'),
                  const Text('variety'),
                  KindView(controller: controller),
                  const Text('products'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(KindView), findsOneWidget);

        await tester.tap(find.byType(FometCard).at(1));
        await tester.pumpAndSettle();

        expect(
          state.kind,
          equals(const (code: '1', description: 'Biologic')),
        );
        expect(find.text('products'), findsOneWidget);
        expect(find.byType(KindView), findsNothing);
      });

      testWidgets('Tap on last item', (tester) async {
        final controller = PageController(initialPage: 2);
        final state = CatalogPageState();

        addTearDown(controller.dispose);

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: state,
            child: MockWrapper(
              child: PageView(
                controller: controller,
                children: [
                  const Text('category'),
                  const Text('variety'),
                  KindView(controller: controller),
                  const Text('products'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(KindView), findsOneWidget);

        await tester.tap(find.byType(FometCard).last);
        await tester.pumpAndSettle();

        expect(
          state.kind,
          equals(const (code: '2', description: 'Biodynamic')),
        );
        expect(find.text('products'), findsOneWidget);
        expect(find.byType(KindView), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('KindView', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: KindView(
                controller: PageController(),
              ),
            ),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/kind_view.png'),
        );
      });
    });
  });
}
