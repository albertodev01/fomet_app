import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/routing/route_names.dart';

void main() {
  group('Route names', () {
    test('Smoke test', () {
      expect(homePagePath, equals('/'));
      expect(productsPagePath, equals('/products'));
      expect(faqPagePath, equals('/faq'));
      expect(aboutPagePath, equals('/about'));
      expect(errorPagePath, equals('/error'));
      expect(catalogPagePath, equals('/catalog'));
      expect(qrScanPath, equals('/qr_scan'));
      expect(productDetailsPath, equals('product_details'));
    });
  });
}
