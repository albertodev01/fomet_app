import 'package:fomet_api_client/src/parsers/catalog/product_info_parser.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/product_info_mock_response.dart';

void main() {
  group('FometCatalogProductInfoParser', () {
    test('Smoke test', () {
      const parser = FometCatalogProductInfoParser(
        xmlContent: productInfoTestResponse,
      );
      expect(parser.xmlContent, equals(productInfoTestResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogProductInfoParser(
        xmlContent: productInfoTestResponse,
      ).parse();

      expect(data.length, equals(1));
      expect(data.first.autumnFertilizer, equals('autumn'));
      expect(data.first.coverageFertilizer, equals('coverage'));
      expect(data.first.description, equals('desc'));
      expect(data.first.image, equals('image'));
      expect(data.first.irrigationFertilizer, equals('irrigation'));
      expect(data.first.notes, equals('notes'));
      expect(data.first.preSowingFertilizer, equals('presowing'));
      expect(data.first.rowFertilizer, equals('row'));
      expect(data.first.springFertilizer, equals('spring'));
      expect(data.first.warning, equals('warning'));
    });
  });
}
