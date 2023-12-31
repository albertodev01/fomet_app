import 'package:fomet_api_client/src/configuration.dart';
import 'package:test/test.dart';

void main() {
  group('Configurations', () {
    test('Smoke test', () {
      expect(apiBaseAddress, equals('ordini.fomet.it'));
      expect(
        servicePath,
        equals('appservice/fometappservicesvc/fometappservicews.svc'),
      );
      expect(productsEndpoint, equals('/articoli'));
      expect(productEndpoint, equals('/articolo'));
      expect(categoriesEndpoint, equals('/categorie'));
      expect(varietiesEndpoint, equals('/varieta'));
      expect(productImageEndpoint, equals('/downloadimage'));
      expect(codeValidationEndpoint, equals('/validaarticolo'));
      expect(appVersionEndpoint, equals('/versionresource'));
    });
  });
}
