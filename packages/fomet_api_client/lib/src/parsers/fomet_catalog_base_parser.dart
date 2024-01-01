import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

/// {@template fomet_api_client.parsers.fometcatalogitem}
/// Each property of a catalog item has a code and a description. The associated
/// XML representation looks like this:
///
/// ```xml
/// <value>
///   <Codice>ALB</Codice>
///   <Descrizione>Alberi da frutto</Descrizione>
/// </value>
/// ```
/// {@endtemplate}
typedef FometCatalogItem = ({String code, String description});

/// Abstract base class for parsing a list of [FometCatalogItem] elements from
/// the FometXML API.
abstract base class FometCatalogBaseParser
    extends FometBaseParser<FometCatalogItem> {
  /// Creates a [FometCatalogBaseParser] object.
  const FometCatalogBaseParser({
    required super.xmlContent,
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

  /// {@macro fomet_api_client.parsers.fometcatalogitem}
  ///
  /// This getter defines the value of the `value` node you see in the example
  /// above.
  String get itemName;
}
