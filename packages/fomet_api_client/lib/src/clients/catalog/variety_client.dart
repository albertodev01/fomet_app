import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/variety_parser.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

/// Fetches the varieties list and returns them into a list of
/// [FometCatalogItem] objects.
base class FometVarietyClient extends FometBaseClient<List<FometCatalogItem>> {
  /// {@macro fomet_api_client.clients.language_code}
  final String languageCode;

  /// The category code.
  final String categoryCode;

  /// Creates a [FometVarietyClient] client.
  const FometVarietyClient({
    required this.languageCode,
    required this.categoryCode,
    super.client,
  }) : super(endpoint: varietiesEndpoint);

  @override
  Future<List<FometCatalogItem>> execute() async {
    final response = await fometGetRequest(
      queryParameters: {
        'mLingua': languageCode,
        'mCodCategoria': categoryCode,
      },
    );

    return FometCatalogVarietyParser(xmlContent: response.body).parse();
  }
}
