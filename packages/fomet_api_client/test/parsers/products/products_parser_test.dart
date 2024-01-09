import 'package:fomet_api_client/src/parsers/products/products_parser.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/products_mock_responses.dart';

void main() {
  group('FometProductsParser', () {
    test('Smoke test', () {
      const parser = FometProductsParser(xmlContent: productsTestResponse);
      expect(parser.xmlContent, equals(productsTestResponse));
    });

    test('Parser result', () {
      final data = const FometProductsParser(
        xmlContent: productsTestResponse,
      ).parse();
      expect(data.length, equals(2));

      for (final element in data.indexed) {
        expect(
          element.$2.code,
          equals(productsParsedResponse[element.$1].code),
        );
        expect(
          element.$2.description,
          equals(productsParsedResponse[element.$1].description),
        );
        expect(
          element.$2.categoryCode,
          equals(productsParsedResponse[element.$1].categoryCode),
        );
        expect(
          element.$2.categoryDescription,
          equals(productsParsedResponse[element.$1].categoryDescription),
        );
        expect(
          element.$2.varietyCode,
          equals(productsParsedResponse[element.$1].varietyCode),
        );
        expect(
          element.$2.varietyDescription,
          equals(productsParsedResponse[element.$1].varietyDescription),
        );
      }
    });
  });
}
