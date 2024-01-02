import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('FometCodeValidationClient', () {
    test('Smoke test', () {
      const client = FometCodeValidationClient(
        productCode: 'abc',
      );

      expect(client.productCode, equals('abc'));
      expect(client.endpoint, equals(codeValidationEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final client = MockClient((request) async {
        return Response(_mockResponse, 200);
      });

      final response = await FometCodeValidationClient(
        productCode: 'abc',
        client: client,
      ).execute();

      expect(response, isTrue);
    });
  });
}

const _mockResponse = '''
<string xmlns="http://schemas.microsoft.com/2003/10/Serialization/">1</string>
''';
