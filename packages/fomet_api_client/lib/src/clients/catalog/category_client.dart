import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:fomet_api_client/src/parsers/catalog/category_parser.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';
import 'package:http/http.dart' as http;

base class FometCategoryClient extends FometBaseClient<List<FometCatalogItem>> {
  final String languageCode;

  /// Creates a [FometCategoryClient] client.
  const FometCategoryClient({
    required this.languageCode,
  }) : super(endpoint: categoriesEndpoint);

  @override
  Future<List<FometCatalogItem>> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {'mLingua': languageCode},
    );

    final response = await http.get(uri, headers: headers);
    return FometCatalogCategoryParser(xmlContent: response.body).parse();
  }
}