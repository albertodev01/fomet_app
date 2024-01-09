import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

/// This type holds all information of a specific Fomet product that is fetched
/// from the catalog.
typedef FometCatalogProductInfo = ({
  String description,
  String coverageFertilizer,
  String preSowingFertilizer,
  String irrigationFertilizer,
  String rowFertilizer,
  String springFertilizer,
  String autumnFertilizer,
  String notes,
  String image,
  String warning,
});

/// Parses the information of a product fetched by [FometProductInfoClient].
/// The [parse] method will **always** return a list with a single object.
///
/// {@template fomet_api_client.product_parser.difference}
/// There are two parsers with similar names that serve different purposes:
///
///  1. [FometCatalogProductInfoParser]: parses XML data fetched from the
///  [FometProductInfoClient] client and returns a **single** element. This
///  parser is used to retrieve information of a single product in the catalog.
///
///  2. [FometProductsParser]: parses XML data fetched from the
///  [FometProductsClient] client and returns a **list** of elements (zero or
///  more). This parser is used to retrieve a list of all products in the
///  catalog.
/// {@endtemplate}
base class FometCatalogProductInfoParser
    extends FometBaseParser<FometCatalogProductInfo> {
  /// Creates a [FometCatalogProductInfoParser] object.
  const FometCatalogProductInfoParser({
    required super.xmlContent,
  });

  /// Gets the element at [index] position in the [elements] list and returns
  /// the content of the `value` node.
  String _valueAt(Iterable<XmlElement> elements, int index) =>
      elements.elementAt(index).findElements('value').first.innerText;

  @override
  List<FometCatalogProductInfo> parse() {
    final xml = XmlDocument.parse(xmlContent);
    final values = xml.findAllElements('item');

    return [
      (
        description: _valueAt(values, 1),
        coverageFertilizer: _valueAt(values, 11),
        preSowingFertilizer: _valueAt(values, 13),
        irrigationFertilizer: _valueAt(values, 12),
        rowFertilizer: _valueAt(values, 10),
        springFertilizer: _valueAt(values, 9),
        autumnFertilizer: _valueAt(values, 8),
        notes: _valueAt(values, 15),
        image: _valueAt(values, 5),
        warning: _valueAt(values, 14),
      ),
    ];
  }
}
