import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_details_view.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_app/src/utils/widgets/product_details_widget.dart';

import '../../../../../mock_wrapper.dart';
import '../../../../../test_utils.dart';

void main() {
  group('ProductsDetailsView', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: ProductsDetailsView(
                controller: PageController(),
                productMockClient: FometMockClient(
                  response: productInfoTestResponse,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(ProductsDetailsView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(
          find.byType(FometFutureBuilder<FometCatalogProductInfo>),
          findsOneWidget,
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Product details test', (tester) async {
        final image = await loadImageAsset(
          tester: tester,
          imageName: 'product_image',
        );

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: ProductsDetailsView(
                controller: PageController(),
                productMockClient: FometMockClient(
                  response: productInfoTestResponse,
                ),
                productImageMockClient: FometMockClient.fromBytes(
                  byteResponse: image,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProductsDetailsView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(find.byType(ProductDetailsWidget), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('CategoryView', (tester) async {
        final image = await loadImageAsset(
          tester: tester,
          imageName: 'product_image',
        );

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: ProductsDetailsView(
                controller: PageController(),
                productMockClient: FometMockClient(
                  response: productInfoTestResponse,
                ),
                productImageMockClient: FometMockClient.fromBytes(
                  byteResponse: image,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/products_details_view.png'),
        );
      });
    });
  });
}

/// An example of a valid XML response about product information.
const productInfoTestResponse = '''
<DettaglioArticolo xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CArticolo" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <DettArticolo>
        <item>
            <Nome>Codart</Nome>
            <value>AKER/BB</value>
        </item>
        <item>
            <Nome>Descrizione</Nome>
            <value>desc</value>
        </item>
        <item>
            <Nome>Descrizione2</Nome>
            <value/>
        </item>
        <item>
            <Nome>Descrizione3</Nome>
            <value/>
        </item>
        <item>
            <Nome>Descrizione4</Nome>
            <value/>
        </item>
        <item>
            <Nome>Immagine</Nome>
            <value>image</value>
        </item>
        <item>
            <Nome>CodVarieta</Nome>
            <value>ACT</value>
        </item>
        <item>
            <Nome>Applicazione_Fogliare</Nome>
            <value>No</value>
        </item>
        <item>
            <Nome>FertAutunnale</Nome>
            <value>autumn</value>
        </item>
        <item>
            <Nome>FertPrimaverile</Nome>
            <value>spring</value>
        </item>
        <item>
            <Nome>FertSuFila</Nome>
            <value>row</value>
        </item>
        <item>
            <Nome>FertCopertura</Nome>
            <value>coverage</value>
        </item>
        <item>
            <Nome>FertIrrigazione</Nome>
            <value>irrigation</value>
        </item>
        <item>
            <Nome>FertPresemina</Nome>
            <value>presowing</value>
        </item>
        <item>
            <Nome>Attenzione</Nome>
            <value>warning</value>
        </item>
        <item>
            <Nome>note</Nome>
            <value>notes</value>
        </item>
    </DettArticolo>
</DettaglioArticolo>
''';
