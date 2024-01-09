import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/products_parser.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

/// Fetches data about a list of products in the Fomet catalog that have the
/// given [categoryCode], [varietyCode] and [kindCode].
base class FometCatalogProductClient
    extends FometBaseClient<List<FometCatalogItem>> {
  /// {@macro fomet_api_client.clients.language_code}
  final String languageCode;

  /// The category code.
  final String categoryCode;

  /// The variety code.
  final String varietyCode;

  /// The kind code.
  final String kindCode;

  /// Creates a [FometCatalogProductClient] client.
  const FometCatalogProductClient({
    required this.languageCode,
    required this.categoryCode,
    required this.varietyCode,
    required this.kindCode,
    super.client,
  }) : super(endpoint: productsEndpoint);

  @override
  Future<List<FometCatalogItem>> execute() async {
    final response = await fometGetRequest(
      queryParameters: {
        'mCodCategoria': categoryCode,
        'mCodVarieta': varietyCode,
        'mCodGestione': kindCode,
        'mLingua': languageCode,
      },
    );

    return FometCatalogProductsParser(xmlContent: response.body).parse();
  }
}
