import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/app_router.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A wrapper of a [MaterialApp] with localization support to be used in widget
/// tests.
class MockWrapper extends StatelessWidget {
  /// The child to be tested.
  final Widget child;

  /// Creates a [MockWrapper] widget.
  const MockWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      theme: ThemeData(
        fontFamily: FometTypography.regular.fontFamily,
      ),
      home: Scaffold(
        body: child,
      ),
    );
  }
}

/// A wrapper of a [MaterialApp] with localization and navigator support to be
/// used in widget tests.
class MockWrapperWithNavigator extends StatelessWidget {
  /// The initial route.
  final String initialRoute;

  /// Creates a [MockWrapperWithNavigator] widget.
  const MockWrapperWithNavigator({
    super.key,
    this.initialRoute = homePagePath,
  });

  @override
  Widget build(BuildContext context) {
    final router = appRouter;

    // Navigates to the desired initial page if needed
    if (initialRoute != homePagePath) {
      appRouter.go(initialRoute);
    }

    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
      ],
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
    );
  }
}
