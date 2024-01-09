import 'dart:typed_data';

import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';

/// An HTTP client that retrieves an image of a product whose code is
/// [productCode].
///
/// The image fetched from the server is in PNG format and [execute] returns
/// its byte representation (as [Uint8List] type).
base class FometProductImageClient extends FometBaseClient<Uint8List> {
  /// The product code associated to the image.
  final String productCode;

  /// Creates a [FometProductImageClient] client.
  const FometProductImageClient({
    required this.productCode,
    super.client,
  }) : super(endpoint: productImageEndpoint);

  @override
  Future<Uint8List> execute() async {
    final response = await fometGetRequest(
      queryParameters: {'mCodArt': productCode},
    );
    return response.bodyBytes;
  }
}
