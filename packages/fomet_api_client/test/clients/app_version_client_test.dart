import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('FometAppVersionClient', () {
    test('Smoke test', () {
      const client = FometAppVersionClient(
        currentVersionCode: '6.3.18',
      );

      expect(client.currentVersionCode, equals('6.3.18'));
      expect(client.endpoint, equals(appVersionEndpoint));
      expect(client.client, isNull);
    });

    test('Request test - code match', () async {
      final client = MockClient((request) async {
        return Response(_mockResponse, 200);
      });

      final response = await FometAppVersionClient(
        currentVersionCode: '7.1',
        client: client,
      ).execute();

      expect(response, isTrue);
    });

    test('Request test - code mismatch', () async {
      final client = MockClient((request) async {
        return Response(_mockResponse, 200);
      });

      final response = await FometAppVersionClient(
        currentVersionCode: '7',
        client: client,
      ).execute();

      expect(response, isFalse);
    });
  });
}

const _mockResponse = '''
<string xmlns="http://schemas.microsoft.com/2003/10/Serialization/">7.1</string>
''';
