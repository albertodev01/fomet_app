import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/product_info_parser.dart';
import 'package:http/http.dart' as http;

base class FometProductInfoClient
    extends FometBaseClient<List<FometCatalogProductInfo>> {
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
  }) : super(endpoint: varietiesEndpoint);

  @override
  Future<List<FometCatalogProductInfo>> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {
        'mLingua': languageCode,
        'mCodCategoria': categoryCode,
        'mCodVarieta': varietyCode,
        'mCodArt': productCode,
      },
    );

    final response = await http.get(uri, headers: headers);
    return FometCatalogProductInfoParser(xmlContent: response.body).parse();
  }
}
