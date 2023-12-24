import 'package:fomet_api_client/src/parsers/fomet_catalog_base_parser.dart';

final class FometCatalogProductsParser extends FometCatalogBaseParser {
  const FometCatalogProductsParser({
    required super.xmlContent,
  });

  @override
  String get itemName => 'itemA';
}
