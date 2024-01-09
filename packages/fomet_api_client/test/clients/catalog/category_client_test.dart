import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/category_mock_responses.dart';

void main() {
  group('FometCategoryClient', () {
    test('Smoke test', () {
      const client = FometCategoryClient(languageCode: 'IT');

      expect(client.languageCode, equals('IT'));
      expect(client.endpoint, equals(categoriesEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(categoryTestResponse, 200);
      });
      final response = await FometCategoryClient(
        languageCode: 'IT',
        client: client,
      ).execute();

      expect(response.length, equals(3));

      for (final element in response.indexed) {
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
