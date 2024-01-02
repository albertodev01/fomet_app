import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/products_mock_responses.dart';

void main() {
  group('FometProductsClient', () {
    test('Smoke test', () {
      const client = FometProductsClient(languageCode: 'IT');

      expect(client.languageCode, equals('IT'));
      expect(client.endpoint, equals(productsEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(productsTestResponse, 200);
      });
      final response = await FometProductsClient(
        languageCode: 'IT',
        client: client,
      ).execute();

      expect(response.length, equals(2));

      for (final element in response.indexed) {
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
