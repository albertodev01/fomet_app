// Navigator keys
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/about/pages/about_page.dart';
import 'package:fomet_app/src/features/faq/pages/faq_page.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/features/home/pages/home_page.dart';
import 'package:fomet_app/src/features/home/pages/qr_scan_page.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/products/pages/product_details_page.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/error_page.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_app/src/utils/widgets/page_scaffold.dart';
import 'package:fomet_app/src/utils/widgets/shell_page_wrapper.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _bottomNavigatorKey = GlobalKey<NavigatorState>();

/// The [GoRouter] object that manages the navigation within the application.
final appRouter = GoRouter(
  initialLocation: homePagePath,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (_, __) => const ErrorPage(),
  routes: [
    ShellRoute(
      navigatorKey: _bottomNavigatorKey,
      builder: (_, __, child) {
        return InheritedObject<CatalogPageState>(
          object: CatalogPageState(),
          child: FometPageScaffold(child: child),
        );
      },
      routes: [
        GoRoute(
          path: homePagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: HomePage()),
        ),
        GoRoute(
          path: productsPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: ProductsPage()),
          routes: [
            GoRoute(
              path: productDetailsPath,
              parentNavigatorKey: _bottomNavigatorKey,
              builder: (_, __) => const ProductsDetailsPage(),
            ),
          ],
        ),
        GoRoute(
          path: faqPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: FaqPage()),
        ),
        GoRoute(
          path: aboutPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: AboutPage()),
        ),
        GoRoute(
          path: catalogPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: CatalogPage()),
        ),
        GoRoute(
          path: qrScanPath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ShellPageWrapper(child: QRScanPage()),
        ),
      ],
    ),
    GoRoute(
      path: errorPagePath,
      builder: (_, __) => const ErrorPage(),
    ),
  ],
);
