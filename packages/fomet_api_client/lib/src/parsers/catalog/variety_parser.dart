import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

/// Parses the categories list fetched by [FometVarietyClient].
final class FometCatalogVarietyParser extends FometCatalogBaseParser {
  /// Creates a [FometCatalogVarietyParser] object.
  const FometCatalogVarietyParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemV';
}
