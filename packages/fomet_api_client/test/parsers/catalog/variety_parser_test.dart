import 'package:fomet_api_client/src/parsers/catalog/variety_parser.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/variety_mock_responses.dart';

void main() {
  group('FometCatalogVarietyParser', () {
    test('Smoke test', () {
      const parser = FometCatalogVarietyParser(
        xmlContent: varietyTestResponse,
      );

      expect(parser.itemName, equals('itemV'));
      expect(parser.xmlContent, equals(varietyTestResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogVarietyParser(
        xmlContent: varietyTestResponse,
      ).parse();

      expect(data.length, equals(3));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(varietyParsedTestResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(varietyParsedTestResponse[element.$1].description),
        );
      }
    });
  });
}
