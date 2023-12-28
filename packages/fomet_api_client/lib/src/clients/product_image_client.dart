import 'dart:typed_data';

import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart' as http;

base class FometProductImageClient extends FometBaseClient<Uint8List> {
  final String productCode;

  /// Creates a [FometProductImageClient] client.
  const FometProductImageClient({
    required this.productCode,
  }) : super(endpoint: productImageEndpoint);

  @override
  Future<Uint8List> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {'mCodArt': productCode},
    );

    final response = await http.get(uri, headers: headers);
    return response.bodyBytes;
  }
}
