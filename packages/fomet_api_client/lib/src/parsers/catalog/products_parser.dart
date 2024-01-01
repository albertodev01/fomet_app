import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

/// Parses the products list fetched by [FometCatalogProductClient].
final class FometCatalogProductsParser extends FometCatalogBaseParser {
  /// Creates a [FometCatalogProductsParser] object.
  const FometCatalogProductsParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemA';
}
