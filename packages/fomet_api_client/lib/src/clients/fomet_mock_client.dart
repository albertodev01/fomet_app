import 'dart:typed_data';

import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

/// This client is generally used in tests for returning a fake response.
final class FometMockClient extends MockClient {
  /// The fake response returned by the client.
  final String response;

  /// The fake byte response returned by the client.
  final Uint8List byteResponse;

  /// Creates a [FometAppVersionClient] client.
  FometMockClient({
    required this.response,
  })  : byteResponse = Uint8List.fromList(const []),
        super((_) async => Response(response, 200));

  /// Creates a [FometAppVersionClient] client.
  FometMockClient.fromBytes({
    required this.byteResponse,
  })  : response = '',
        super((_) async => Response.bytes(byteResponse, 200));
}
