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

final class FometProductsParser extends FometBaseParser<FometProduct> {
  final String nodeName;
  final String xmlContent;
  const FometProductsParser({
    required this.xmlContent,
    required this.nodeName,
  });

  @override
  List<FometProduct> parse() {
    final xml = XmlDocument.parse(xmlContent);
    return xml.findAllElements(nodeName).map((element) {
      return (
        code: element.findElements('Codice').first.innerText,
        description: element.findElements('Descrizione').first.innerText,
        varietyCode: element.findElements('CodVarieta').first.innerText,
        varietyDescription: element.findElements('DescVarieta').first.innerText,
        categoryCode: element.findElements('CodCategoria').first.innerText,
        categoryDescription:
            element.findElements('DescCategoria').first.innerText,
      );
    }).toList(growable: false);
  }
}
