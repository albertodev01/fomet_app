import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/features/products/state/products_page_state.dart';
import 'package:fomet_app/src/features/products/widgets/products_result.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('ProductsPage', () {
    const testProduct = (
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
          InheritedObject<ProductsPageState>(
            object: ProductsPageState(),
            child: MockWrapper(
              child: ProductsPage(
                mockClient: FometMockClient(response: productsTestResponse),
              ),
            ),
          ),
        );

        expect(find.byType(ProductsPage), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(
          find.byType(FometFutureBuilder<List<FometProduct>>),
          findsOneWidget,
        );
        expect(find.byType(ProductsResult), findsNothing);
      });

      testWidgets('Products results test', (tester) async {
        await tester.runAsync(
          () => tester.pumpWidget(
            InheritedObject<ProductsPageState>(
              object: ProductsPageState()..products = [testProduct],
              child: MockWrapper(
                child: ProductsPage(
                  mockClient: FometMockClient(response: productsTestResponse),
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(ProductsPage), findsOneWidget);
        expect(find.byType(ProductsResult), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('ProductsPage', (tester) async {
        await tester.pumpWidget(
          InheritedObject<ProductsPageState>(
            object: ProductsPageState()..products = const [testProduct],
            child: MockWrapper(
              child: ProductsPage(
                mockClient: FometMockClient(response: productsTestResponse),
              ),
            ),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/products_page.png'),
        );
      });
    });
  });
}

/// An example of a valid XML response for the products list.
const productsTestResponse = r'''
<ElencoArticoli xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CArticoli" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Articoli>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AKER/BB</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AKER ® PELLET BIG BAG DA 500 KG</Descrizione>
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
    </Articoli>
</ElencoArticoli>
''';
