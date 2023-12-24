import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

final class FometCatalogVarietyParser extends FometCatalogBaseParser {
  const FometCatalogVarietyParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemV';
}
