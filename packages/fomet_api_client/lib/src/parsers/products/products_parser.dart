import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_api_client/src/parsers/fomet_base_parser.dart';
import 'package:xml/xml.dart';

/// This type holds all information returned by the list of all products in the
/// Fomet catalog.
typedef FometProduct = ({
  String code,
  String description,
  String varietyCode,
  String varietyDescription,
  String categoryCode,
  String categoryDescription,
});

/// Parses the information of a product fetched by [FometProductsClient].
///
/// {@macro fomet_api_client.product_parser.difference}
final class FometProductsParser extends FometBaseParser<FometProduct> {
  /// Crates a [FometProductsParser] object.
  const FometProductsParser({
    required super.xmlContent,
  });

  @override
  List<FometProduct> parse() {
    final xml = XmlDocument.parse(xmlContent);
    return xml.findAllElements('itemA').map((element) {
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
