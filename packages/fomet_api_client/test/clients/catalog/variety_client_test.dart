import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../utils/mock_responses/variety_mock_responses.dart';

void main() {
  group('FometVarietyClient', () {
    test('Smoke test', () {
      const client = FometVarietyClient(
        languageCode: 'IT',
        categoryCode: 'cat',
      );

      expect(client.languageCode, equals('IT'));
      expect(client.categoryCode, equals('cat'));
      expect(client.endpoint, equals(varietiesEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(varietyTestResponse, 200);
      });
      final response = await FometVarietyClient(
        languageCode: 'IT',
        categoryCode: 'cat',
        client: client,
      ).execute();

      expect(response.length, equals(3));

      for (final element in response.indexed) {
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
