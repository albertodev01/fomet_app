import 'dart:io';

import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('FometProductImageClient', () {
    test('Smoke test', () {
      const client = FometProductImageClient(productCode: 'abc');

      expect(client.productCode, equals('abc'));
      expect(client.endpoint, equals(productImageEndpoint));
      expect(client.client, isNull);
    });

    test('Request test', () async {
      final image = await File('test/utils/product_image.png').readAsBytes();
      final client = MockClient((request) async {
        return Response.bytes(image, 200);
      });

      final response = await FometProductImageClient(
        productCode: 'abc',
        client: client,
      ).execute();

      expect(response, equals(image));
    });
  });
}
