import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

typedef FometProduct = ({
  String code,
  String description,
  String varietyCode,
  String varietyDescription,
  String categoryCode,
  String categoryDescription,
});

class FometProductsParser implements FometBaseParser<List<FometProduct>> {
  final String nodeName;
  final String xmlContent;
  final String? codeFilter;
  final bool noDuplicateCodes;
  const FometProductsParser({
    required this.xmlContent,
    required this.nodeName,
    this.noDuplicateCodes = false,
    this.codeFilter,
  });

  FometProduct _mapXmlElementToProduct(XmlElement element) {
    return (
      code: element.findElements('Codice').first.innerText,
      description: element.findElements('CodVarieta').first.innerText,
      varietyCode: element.findElements('Descrizione').first.innerText,
      varietyDescription: element.findElements('DescVarieta').first.innerText,
      categoryCode: element.findElements('CodCategoria').first.innerText,
      categoryDescription:
          element.findElements('DescCategoria').first.innerText,
    );
  }

  bool _whereNoDuplicate({
    required (int, XmlElement) value,
    required Iterable<XmlElement> products,
  }) {
    if (value.$1 > 1) {
      final index = value.$1;
      final element = value.$2;

      final current = element.findElements('Codice').first.innerText;
      final previous =
          products.elementAt(index - 1).findElements('Codice').first.innerText;
      return current != previous;
    }
    return true;
  }

  bool _sameCode(XmlElement element) {
    return element.findElements('Codice').first.innerText == codeFilter;
  }

  @override
  List<FometProduct> parse() {
    final xml = XmlDocument.parse(xmlContent);
    final products = xml.findAllElements(nodeName);

    if (codeFilter != null) {
      return products
          .where(_sameCode)
          .map(_mapXmlElementToProduct)
          .toList(growable: false);
    }

    if (noDuplicateCodes) {
      return products.indexed
          .where((value) => _whereNoDuplicate(value: value, products: products))
          .map((value) => _mapXmlElementToProduct(value.$2))
          .toList(growable: false);
    }

    return products.map(_mapXmlElementToProduct).toList(growable: false);
  }
}
