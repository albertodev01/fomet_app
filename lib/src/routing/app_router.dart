// Navigator keys
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/about/pages/about_page.dart';
import 'package:fomet_app/src/features/faq/pages/faq_page.dart';
import 'package:fomet_app/src/features/home/pages/home_page.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog_page.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/error_page.dart';
import 'package:fomet_app/src/utils/widgets/page_scaffold.dart';
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
      builder: (_, __, child) => FometPageScaffold(child: child),
      routes: [
        GoRoute(
          path: homePagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: productsPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const ProductsPage(),
        ),
        GoRoute(
          path: faqPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const FaqPage(),
        ),
        GoRoute(
          path: aboutPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => const AboutPage(),
        ),
        GoRoute(
          path: catalogPagePath,
          parentNavigatorKey: _bottomNavigatorKey,
          builder: (_, __) => InheritedCatalogState(
            catalogState: CatalogPageState(),
            child: const CatalogPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: errorPagePath,
      builder: (_, __) => const ErrorPage(),
    ),
  ],
);
