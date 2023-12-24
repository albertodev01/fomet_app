import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

typedef FometCatalogProductInfo = ({
  String code,
  String description,
});

base class FometCatalogProductInfoParser
    extends FometBaseParser<FometCatalogProductInfo> {
  final String xmlContent;
  const FometCatalogProductInfoParser({
    required this.xmlContent,
  });

  @override
  List<FometCatalogProductInfo> parse() {
    final xml = XmlDocument.parse(xmlContent);

    return xml.findAllElements(_itemName).map<FometCatalogProductInfo>((node) {
      return (
        code: node.findElements('Codice').first.innerText,
        description: node.findElements('Descrizione').first.innerText,
      );
    }).toList(growable: false);
  }

  String get _itemName => 'item';
}
