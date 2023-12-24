import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

final class FometCatalogCategoryParser extends FometCatalogBaseParser {
  const FometCatalogCategoryParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemC';
}
