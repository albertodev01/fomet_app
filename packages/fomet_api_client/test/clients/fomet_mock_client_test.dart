import 'dart:typed_data';

import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:test/test.dart';

void main() {
  group('FometMockClient', () {
    test('Smoke test', () {
      final client = FometMockClient(
        response: 'test',
      );
      final byteClient = FometMockClient.fromBytes(
        byteResponse: Uint8List(0),
      );

      expect(client.response, equals('test'));
      expect(client.byteResponse, equals(Uint8List.fromList(const [])));
      expect(byteClient.response, equals(''));
      expect(byteClient.byteResponse, equals(Uint8List(0)));
    });

    test('Request test', () async {
      final stringResponse = await FometMockClient(
        response: 'test',
      ).get(Uri.https('test.com'));

      expect(
        stringResponse.body,
        equals('test'),
      );

      final byteResponse = await FometMockClient.fromBytes(
        byteResponse: Uint8List.fromList(const [1, 2, 3]),
      ).get(Uri.https('test.com'));

      expect(
        byteResponse.bodyBytes,
        equals(
          Uint8List.fromList(const [1, 2, 3]),
        ),
      );
    });
  });
}
