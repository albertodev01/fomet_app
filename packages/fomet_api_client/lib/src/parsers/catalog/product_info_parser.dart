import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

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
    final values = xml.findAllElements(_itemName);

    return [
      (
        description: values.elementAt(1).innerText,
        coverageFertilizer: values.elementAt(11).innerText,
        preSowingFertilizer: values.elementAt(13).innerText,
        irrigationFertilizer: values.elementAt(12).innerText,
        rowFertilizer: values.elementAt(10).innerText,
        springFertilizer: values.elementAt(9).innerText,
        autumnFertilizer: values.elementAt(8).innerText,
        notes: values.elementAt(15).innerText,
        image: values.elementAt(5).innerText,
      ),
    ];
  }

  String get _itemName => 'item';
}
