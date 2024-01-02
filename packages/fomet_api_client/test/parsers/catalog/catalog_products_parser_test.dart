import 'package:fomet_api_client/src/parsers/catalog/products_parser.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/catalog_products_mock_responses.dart';

void main() {
  group('FometCatalogProductsParser', () {
    test('Smoke test', () {
      const parser = FometCatalogProductsParser(
        xmlContent: catalogProductsTestResponse,
      );

      expect(parser.itemName, equals('itemA'));
      expect(parser.xmlContent, equals(catalogProductsTestResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogProductsParser(
        xmlContent: catalogProductsTestResponse,
      ).parse();

      expect(data.length, equals(3));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(catalogProductsParsedResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(catalogProductsParsedResponse[element.$1].description),
        );
      }
    });
  });
}
