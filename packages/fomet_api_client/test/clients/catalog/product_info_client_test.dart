import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/product_info_mock_response.dart';

void main() {
  group('FometProductInfoClient', () {
    test('Smoke test', () {
      const client = FometProductInfoClient(
        languageCode: 'IT',
        categoryCode: 'cat',
        varietyCode: 'var',
        productCode: 'prod',
      );

      expect(client.languageCode, equals('IT'));
      expect(client.categoryCode, equals('cat'));
      expect(client.varietyCode, equals('var'));
      expect(client.productCode, equals('prod'));
      expect(client.endpoint, equals(productEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(productInfoTestResponse, 200);
      });
      final response = await FometProductInfoClient(
        languageCode: 'IT',
        categoryCode: 'cat',
        varietyCode: 'var',
        productCode: 'prod',
        client: client,
      ).execute();

      expect(response.autumnFertilizer, equals('autumn'));
      expect(response.coverageFertilizer, equals('coverage'));
      expect(response.description, equals('desc'));
      expect(response.image, equals('image'));
      expect(response.irrigationFertilizer, equals('irrigation'));
      expect(response.notes, equals('notes'));
      expect(response.preSowingFertilizer, equals('presowing'));
      expect(response.rowFertilizer, equals('row'));
      expect(response.springFertilizer, equals('spring'));
      expect(response.warning, equals('warning'));
    });
  });
}
