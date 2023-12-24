import 'dart:isolate';

import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/products/products_parser.dart';
import 'package:http/http.dart' as http;

base class FometProductsClient extends FometBaseClient<List<FometProduct>> {
  final String languageCode;
  final String? codeFilter;
  final bool noDuplicateCodes;

  /// Creates a [FometProductsClient] client.
  const FometProductsClient({
    required this.languageCode,
    this.noDuplicateCodes = false,
    this.codeFilter,
  }) : super(endpoint: productsEndpoint);

  @override
  Future<List<FometProduct>> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {
        'mCodCategoria': '',
        'mCodVarieta': '',
        'mCodGestione': '',
        'mLingua': languageCode,
      },
    );

    final response = await http.get(uri, headers: headers);

    return Isolate.run<List<FometProduct>>(() {
      final parser = FometProductsParser(
        xmlContent: response.body,
        nodeName: 'itemA',
        codeFilter: codeFilter,
        noDuplicateCodes: noDuplicateCodes,
      );

      return parser.parse();
    });
  }
}
