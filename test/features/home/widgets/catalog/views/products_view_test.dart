import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_view.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../../../mock_wrapper.dart';

void main() {
  group('ProductsView', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: ProductsView(
                controller: PageController(),
                mockClient: FometMockClient(
                  response: catalogProductsTestResponse,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(ProductsView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(
          find.byType(FometFutureBuilder<List<FometCatalogItem>>),
          findsOneWidget,
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Tap on item', (tester) async {
        final controller = PageController(initialPage: 3);
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
                  const Text('kind'),
                  ProductsView(
                    controller: controller,
                    mockClient: FometMockClient(
                      response: catalogProductsTestResponse,
                    ),
                  ),
                  const Text('details'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(ProductsView), findsOneWidget);
        expect(find.byType(FometCard), findsNWidgets(3));

        await tester.tap(find.byType(FometCard).first);
        await tester.pumpAndSettle();

        expect(
          state.product,
          equals(
            const (code: 'AKER/BB', description: 'AKER BIG BAG DA 500 KG'),
          ),
        );
        expect(find.text('details'), findsOneWidget);
        expect(find.byType(ProductsView), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('CategoryView', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: ProductsView(
                controller: PageController(),
                mockClient: FometMockClient(
                  response: catalogProductsTestResponse,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/products_view.png'),
        );
      });
    });
  });
}

/// An example of a valid XML response for the catalog products list.
const catalogProductsTestResponse = r'''
<ElencoArticoli xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CArticoli" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Articoli>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AKER/BB</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AKER BIG BAG DA 500 KG</Descrizione>
            <Descrizione2/>
            <immagine>\FOSRV003RobImmaginiAKER.png</immagine>
        </itemA>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AMINCALC012</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AMINOSPRINT ® CALCIO DA KG 12</Descrizione>
            <Descrizione2/>
            <immagine>\FOSRV003RobImmaginiAminosprint-calcio.png</immagine>
        </itemA>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>VIGORAMINPOWER/5KG</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>VIGORAMIN ® POWER tanica da 5KG</Descrizione>
            <Descrizione2/>
            <immagine>\FOSRV003RobImmaginiVigoramin-Power.png</immagine>
        </itemA>
    </Articoli>
</ElencoArticoli>
''';
