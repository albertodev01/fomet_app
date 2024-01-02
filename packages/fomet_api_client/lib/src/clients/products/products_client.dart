import 'dart:isolate';

import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/products/products_parser.dart';

/// Fetches the list of all products in the Fomet catalog.
base class FometProductsClient extends FometBaseClient<List<FometProduct>> {
  /// {@macro fomet_api_client.clients.language_code}
  final String languageCode;

  /// Creates a [FometProductsClient] client.
  const FometProductsClient({
    required this.languageCode,
    super.client,
  }) : super(endpoint: productsEndpoint);

  @override
  Future<List<FometProduct>> execute() async {
    final response = await fometGetRequest(
      queryParameters: {
        'mCodCategoria': '',
        'mCodVarieta': '',
        'mCodGestione': '',
        'mLingua': languageCode,
      },
    );

    /*
     * The parser should run in a separate isolate because the full products
     * list is very big and we have noticed that parsing takes more than a few
     * milliseconds to execute (on average).
     */
    return Isolate.run<List<FometProduct>>(() {
      final parser = FometProductsParser(xmlContent: response.body);
      return parser.parse();
    });
  }
}
