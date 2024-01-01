import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

/// Parses the categories list fetched by [FometCategoryClient].
final class FometCatalogCategoryParser extends FometCatalogBaseParser {
  /// Creates a [FometCatalogCategoryParser] object.
  const FometCatalogCategoryParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemC';
}
