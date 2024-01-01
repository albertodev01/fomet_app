import 'package:fomet_api_client/src/parsers/catalog/category_parser.dart';
import 'package:test/test.dart';

void main() {
  group('FometCatalogCategoryParser', () {
    test('Smoke test', () {
      const parser = FometCatalogCategoryParser(xmlContent: testResponse);

      expect(parser.itemName, equals('itemC'));
      expect(parser.xmlContent, equals(testResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogCategoryParser(
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
  (code: 'ALB', description: 'Alberi da frutto'),
  (code: 'ARE', description: 'Aree verdi'),
  (code: 'CER', description: 'Cereali'),
];

/// An example of a valid XML response.
const testResponse = '''
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
