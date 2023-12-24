import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/variety_parser.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';
import 'package:http/http.dart' as http;

base class FometVarietyClient extends FometBaseClient<List<FometCatalogItem>> {
  final String languageCode;
  final String categoryCode;

  /// Creates a [FometVarietyClient] client.
  const FometVarietyClient({
    required this.languageCode,
    required this.categoryCode,
  }) : super(endpoint: varietiesEndpoint);

  @override
  Future<List<FometCatalogItem>> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {
        'mLingua': languageCode,
        'mCodCategoria': categoryCode,
      },
    );

    final response = await http.get(uri, headers: headers);
    return FometCatalogVarietyParser(xmlContent: response.body).parse();
  }
}
