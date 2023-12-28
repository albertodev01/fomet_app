import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/products_parser.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';
import 'package:http/http.dart' as http;

base class FometCatalogProductClient
    extends FometBaseClient<List<FometCatalogItem>> {
  final String languageCode;
  final String categoryCode;
  final String varietyCode;
  final String kindCode;

  /// Creates a [FometCatalogProductClient] client.
  const FometCatalogProductClient({
    required this.languageCode,
    required this.categoryCode,
    required this.varietyCode,
    required this.kindCode,
  }) : super(endpoint: productsEndpoint);

  @override
  Future<List<FometCatalogItem>> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {
        'mCodCategoria': categoryCode,
        'mCodVarieta': varietyCode,
        'mCodGestione': kindCode,
        'mLingua': languageCode,
      },
    );

    final response = await http.get(uri, headers: headers);
    return FometCatalogProductsParser(xmlContent: response.body).parse();
  }
}
