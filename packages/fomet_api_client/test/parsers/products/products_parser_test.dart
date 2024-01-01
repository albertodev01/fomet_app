import 'package:fomet_api_client/src/parsers/products/products_parser.dart';
import 'package:test/test.dart';

void main() {
  group('FometProductsParser', () {
    test('Smoke test', () {
      const parser = FometProductsParser(xmlContent: testResponse);
      expect(parser.xmlContent, equals(testResponse));
    });

    test('Parser result', () {
      final data = const FometProductsParser(xmlContent: testResponse).parse();
      expect(data.length, equals(2));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(parsedResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(parsedResponse[element.$1].description),
        );
        expect(
          element.$2.categoryCode,
          equals(parsedResponse[element.$1].categoryCode),
        );
        expect(
          element.$2.categoryDescription,
          equals(parsedResponse[element.$1].categoryDescription),
        );
        expect(
          element.$2.varietyCode,
          equals(parsedResponse[element.$1].varietyCode),
        );
        expect(
          element.$2.varietyDescription,
          equals(parsedResponse[element.$1].varietyDescription),
        );
      }
    });
  });
}

/// The expected Dart object parsed from [testResponse].
const parsedResponse = [
  (
    code: 'AKER/BB',
    description: 'AKER ® PELLET BIG BAG DA 500 KG',
    categoryCode: 'ALB',
    categoryDescription: 'Alberi da frutto',
    varietyCode: 'ACT',
    varietyDescription: 'Actinidia',
  ),
  (
    code: 'AMINCALC012',
    description: 'AMINOSPRINT ® CALCIO DA KG 12',
    categoryCode: 'ALB',
    categoryDescription: 'Alberi da frutto',
    varietyCode: 'ACT',
    varietyDescription: 'Actinidia',
  ),
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
    </Articoli>
</ElencoArticoli>
''';
