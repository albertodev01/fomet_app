import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/catalog_products_mock_responses.dart';

void main() {
  group('FometCatalogProductClient', () {
    test('Smoke test', () {
      const client = FometCatalogProductClient(
        languageCode: 'IT',
        categoryCode: 'cat',
        kindCode: 'kind',
        varietyCode: 'var',
      );

      expect(client.languageCode, equals('IT'));
      expect(client.categoryCode, equals('cat'));
      expect(client.varietyCode, equals('var'));
      expect(client.kindCode, equals('kind'));
      expect(client.endpoint, equals(productsEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(catalogProductsTestResponse, 200);
      });
      final response = await FometCatalogProductClient(
        languageCode: 'IT',
        categoryCode: 'cat',
        kindCode: 'kind',
        varietyCode: 'var',
        client: client,
      ).execute();

      expect(response.length, equals(3));

      for (final element in response.indexed) {
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
