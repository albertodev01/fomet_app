import 'package:fomet_api_client/src/parsers/catalog/category_parser.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/category_mock_responses.dart';

void main() {
  group('FometCatalogCategoryParser', () {
    test('Smoke test', () {
      const parser = FometCatalogCategoryParser(
        xmlContent: categoryTestResponse,
      );

      expect(parser.itemName, equals('itemC'));
      expect(parser.xmlContent, equals(categoryTestResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogCategoryParser(
        xmlContent: categoryTestResponse,
      ).parse();

      expect(data.length, equals(3));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(categoryParsedTestResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(categoryParsedTestResponse[element.$1].description),
        );
      }
    });
  });
}
