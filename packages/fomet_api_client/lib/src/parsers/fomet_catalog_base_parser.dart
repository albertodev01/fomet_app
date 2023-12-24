import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

typedef FometCatalogItem = ({String code, String description});

abstract base class FometCatalogBaseParser
    extends FometBaseParser<FometCatalogItem> {
  final String xmlContent;
  const FometCatalogBaseParser({
    required this.xmlContent,
  });

  @override
  List<FometCatalogItem> parse() {
    final xml = XmlDocument.parse(xmlContent);

    return xml.findAllElements(itemName).map<FometCatalogItem>((node) {
      return (
        code: node.findElements('Codice').first.innerText,
        description: node.findElements('Descrizione').first.innerText,
      );
    }).toList(growable: false);
  }

  String get itemName;
}
