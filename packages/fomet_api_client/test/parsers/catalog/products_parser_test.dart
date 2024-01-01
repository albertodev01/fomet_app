import 'package:fomet_api_client/src/parsers/catalog/products_parser.dart';
import 'package:test/test.dart';

void main() {
  group('FometCatalogProductsParser', () {
    test('Smoke test', () {
      const parser = FometCatalogProductsParser(xmlContent: testResponse);

      expect(parser.itemName, equals('itemA'));
      expect(parser.xmlContent, equals(testResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogProductsParser(
        xmlContent: testResponse,
      ).parse();

      expect(data.length, equals(3));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(parsedResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(parsedResponse[element.$1].description),
        );
      }
    });
  });
}

/// The expected Dart object parsed from [testResponse].
const parsedResponse = [
  (code: 'AKER/BB', description: 'AKER ® PELLET BIG BAG DA 500 KG'),
  (code: 'AMINCALC012', description: 'AMINOSPRINT ® CALCIO DA KG 12'),
  (code: 'VIGORAMINPOWER/5KG', description: 'VIGORAMIN ® POWER tanica da 5KG'),
];

/// An example of a valid XML response.
const testResponse = r'''
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
            <immagine>\\FOSRV003\Rob\Immagini\AKER.png</immagine>
        </itemA>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AMINCALC012</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AMINOSPRINT ® CALCIO DA KG 12</Descrizione>
            <Descrizione2/>
            <immagine>\\FOSRV003\Rob\Immagini\Aminosprint-calcio.png</immagine>
        </itemA>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>VIGORAMINPOWER/5KG</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>VIGORAMIN ® POWER tanica da 5KG</Descrizione>
            <Descrizione2/>
            <immagine>\\FOSRV003\Rob\Immagini\Vigoramin-Power.png</immagine>
        </itemA>
    </Articoli>
</ElencoArticoli>
''';
