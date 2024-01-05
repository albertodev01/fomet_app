import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/app_router.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A wrapper of a [MaterialApp] with localization support to be used in widget
/// tests.
class MockWrapper extends StatelessWidget {
  /// The child to be tested.
  final Widget child;

  /// An optional [FometMockClient] object for mocking requests.
  final FometMockClient? client;

  /// Creates a [MockWrapper] widget.
  const MockWrapper({
    required this.child,
    this.client,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InheritedObject<FometMockClient?>(
      object: client,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: FometTypography.regular.fontFamily,
        ),
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }
}

/// A wrapper of a [MaterialApp] with localization and navigator support to be
/// used in widget tests.
class MockWrapperWithNavigator extends StatelessWidget {
  /// The initial route.
  final String initialRoute;

  /// An optional [FometMockClient] object for mocking requests.
  final FometMockClient? client;

  /// Creates a [MockWrapperWithNavigator] widget.
  const MockWrapperWithNavigator({
    super.key,
    this.initialRoute = homePagePath,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    return InheritedObject<FometMockClient?>(
      object: client,
      child: MaterialApp.router(
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
