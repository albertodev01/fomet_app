import 'package:fomet_api_client/src/parsers/catalog/variety_parser.dart';
import 'package:test/test.dart';

void main() {
  group('FometCatalogVarietyParser', () {
    test('Smoke test', () {
      const parser = FometCatalogVarietyParser(xmlContent: testResponse);

      expect(parser.itemName, equals('itemV'));
      expect(parser.xmlContent, equals(testResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogVarietyParser(
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
  (code: 'ACT', description: 'Actinidia'),
  (code: 'CAS', description: 'Castagno'),
  (code: 'NOE', description: 'Noce'),
];

/// An example of a valid XML response.
const testResponse = '''
<ElencoVarieta xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CVarieta" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Varieta>
        <itemV>
            <Codice>ACT</Codice>
            <Descrizione>Actinidia</Descrizione>
        </itemV>
        <itemV>
            <Codice>CAS</Codice>
            <Descrizione>Castagno</Descrizione>
        </itemV>
        <itemV>
            <Codice>NOE</Codice>
            <Descrizione>Noce</Descrizione>
        </itemV>
    </Varieta>
</ElencoVarieta>
''';
