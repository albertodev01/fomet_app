import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/product_info_parser.dart';

/// Fetches data about a specific product in the Fomet catalog which has the
/// given [categoryCode], [varietyCode] and [productCode].
///
/// The [execute] method **always** returns a list with a single
/// [FometCatalogProductInfo] object.
base class FometProductInfoClient
    extends FometBaseClient<FometCatalogProductInfo> {
  /// {@macro fomet_api_client.clients.language_code}
  final String languageCode;

  /// The category code.
  final String categoryCode;

  /// The variety code.
  final String varietyCode;

  /// The product code.
  final String productCode;

  /// Creates a [FometProductInfoClient] client.
  const FometProductInfoClient({
    required this.languageCode,
    required this.categoryCode,
    required this.varietyCode,
    required this.productCode,
    super.client,
  }) : super(endpoint: productEndpoint);

  @override
  Future<FometCatalogProductInfo> execute() async {
    final response = await fometGetRequest(
      queryParameters: {
        'mLingua': languageCode,
        'mCodCategoria': categoryCode,
        'mCodVarieta': varietyCode,
        'mCodArt': productCode,
      },
    );

    final result = FometCatalogProductInfoParser(
      xmlContent: response.body,
    ).parse();

    return result.first;
  }
}
