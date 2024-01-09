import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/routing/app_router.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:go_router/go_router.dart';

void main() {
  /// Converts [base] to a [GoRoute] type.
  GoRoute convert(RouteBase base) => base as GoRoute;

  group('Application router', () {
    test('Smoke test', () {
      final routes = appRouter.configuration.routes;

      expect(routes.length, equals(2));
      expect((routes.first as ShellRoute).routes.length, equals(6));
      expect(convert(routes[1]).path, equals(errorPagePath));
    });

    test('Shell route test', () {
      final routes = appRouter.configuration.routes.first.routes;

      expect(convert(routes.first).path, equals(homePagePath));
      expect(convert(routes[1]).path, equals(productsPagePath));
      expect(convert(routes[2]).path, equals(faqPagePath));
      expect(convert(routes[3]).path, equals(aboutPagePath));
      expect(convert(routes[4]).path, equals(catalogPagePath));
      expect(convert(routes[5]).path, equals(qrScanPath));
    });
  });
}
