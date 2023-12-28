import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/product_info_parser.dart';
import 'package:http/http.dart' as http;

base class FometProductInfoClient
    extends FometBaseClient<FometCatalogProductInfo> {
  final String languageCode;
  final String categoryCode;
  final String varietyCode;
  final String productCode;

  /// Creates a [FometProductInfoClient] client.
  const FometProductInfoClient({
    required this.languageCode,
    required this.categoryCode,
    required this.varietyCode,
    required this.productCode,
  }) : super(endpoint: productEndpoint);

  @override
  Future<FometCatalogProductInfo> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {
        'mLingua': languageCode,
        'mCodCategoria': categoryCode,
        'mCodVarieta': varietyCode,
        'mCodArt': productCode,
      },
    );

    final response = await http.get(uri, headers: headers);
    final result = FometCatalogProductInfoParser(
      xmlContent: response.body,
    ).parse();

    return result.first;
  }
}
