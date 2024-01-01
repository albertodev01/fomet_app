import 'package:fomet_api_client/src/parsers/catalog/product_info_parser.dart';
import 'package:test/test.dart';

void main() {
  group('FometCatalogProductInfoParser', () {
    test('Smoke test', () {
      const parser = FometCatalogProductInfoParser(xmlContent: testResponse);
      expect(parser.xmlContent, equals(testResponse));
    });

    test('Parser result', () {
      final data = const FometCatalogProductInfoParser(
        xmlContent: testResponse,
      ).parse();

      expect(data.length, equals(1));
      expect(data.first.autumnFertilizer, equals('autumn'));
      expect(data.first.coverageFertilizer, equals('coverage'));
      expect(data.first.description, equals('desc'));
      expect(data.first.image, equals('image'));
      expect(data.first.irrigationFertilizer, equals('irrigation'));
      expect(data.first.notes, equals('notes'));
      expect(data.first.preSowingFertilizer, equals('presowing'));
      expect(data.first.rowFertilizer, equals('row'));
      expect(data.first.springFertilizer, equals('spring'));
      expect(data.first.warning, equals('warning'));
    });
  });
}

/// An example of a valid XML response.
const testResponse = '''
<DettaglioArticolo xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CArticolo" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <DettArticolo>
        <item>
            <Nome>Codart</Nome>
            <value>AKER/BB</value>
        </item>
        <item>
            <Nome>Descrizione</Nome>
            <value>desc</value>
        </item>
        <item>
            <Nome>Descrizione2</Nome>
            <value/>
        </item>
        <item>
            <Nome>Descrizione3</Nome>
            <value/>
        </item>
        <item>
            <Nome>Descrizione4</Nome>
            <value/>
        </item>
        <item>
            <Nome>Immagine</Nome>
            <value>image</value>
        </item>
        <item>
            <Nome>CodVarieta</Nome>
            <value>ACT</value>
        </item>
        <item>
            <Nome>Applicazione_Fogliare</Nome>
            <value>No</value>
        </item>
        <item>
            <Nome>FertAutunnale</Nome>
            <value>autumn</value>
        </item>
        <item>
            <Nome>FertPrimaverile</Nome>
            <value>spring</value>
        </item>
        <item>
            <Nome>FertSuFila</Nome>
            <value>row</value>
        </item>
        <item>
            <Nome>FertCopertura</Nome>
            <value>coverage</value>
        </item>
        <item>
            <Nome>FertIrrigazione</Nome>
            <value>irrigation</value>
        </item>
        <item>
            <Nome>FertPresemina</Nome>
            <value>presowing</value>
        </item>
        <item>
            <Nome>Attenzione</Nome>
            <value>warning</value>
        </item>
        <item>
            <Nome>note</Nome>
            <value>notes</value>
        </item>
    </DettArticolo>
</DettaglioArticolo>
''';
