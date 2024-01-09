import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/category_view.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../../../mock_wrapper.dart';

void main() {
  group('CategoryView', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: CategoryView(
                controller: PageController(),
                mockClient: FometMockClient(response: categoryTestResponse),
              ),
            ),
          ),
        );

        expect(find.byType(CategoryView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(
          find.byType(FometFutureBuilder<List<FometCatalogItem>>),
          findsOneWidget,
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Tap on item', (tester) async {
        final controller = PageController();
        final state = CatalogPageState();

        addTearDown(controller.dispose);

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: state,
            child: MockWrapper(
              child: PageView(
                controller: controller,
                children: [
                  CategoryView(
                    controller: controller,
                    mockClient: FometMockClient(response: categoryTestResponse),
                  ),
                  const Text('test'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(CategoryView), findsOneWidget);
        expect(find.byType(FometCard), findsNWidgets(3));

        await tester.tap(find.byType(FometCard).first);
        await tester.pumpAndSettle();

        expect(
          state.category,
          equals(const (code: 'ALB', description: 'Alberi da frutto')),
        );
        expect(find.text('test'), findsOneWidget);
        expect(find.byType(CategoryView), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('CategoryView', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: CategoryView(
                controller: PageController(),
                mockClient: FometMockClient(response: categoryTestResponse),
              ),
            ),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/category_view.png'),
        );
      });
    });
  });
}

/// An example of a valid XML response for the categories list.
const categoryTestResponse = '''
<ElencoCategorie xmlns="http://schemas.datacontract.org/2004/07/FometAppService.ccategorie" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Categorie>
        <itemC>
            <Codice>ALB</Codice>
            <Descrizione>Alberi da frutto</Descrizione>
        </itemC>
        <itemC>
            <Codice>ARE</Codice>
            <Descrizione>Aree verdi</Descrizione>
        </itemC>
        <itemC>
            <Codice>CER</Codice>
            <Descrizione>Cereali</Descrizione>
        </itemC>
    </Categorie>
</ElencoCategorie>
''';
