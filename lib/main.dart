import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/app_router.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// The application's main entrypoint.
void main() {
  // Uses path-based navigation on web and hides the hash
  usePathUrlStrategy();

  // Runs the app
  runApp(const FometApp());
}

/// The root widget of the application.
class FometApp extends StatelessWidget {
  /// Creates a [FometApp] widget.
  const FometApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Theme configurations
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: FometColors.seed,
          primary: FometColors.primary,
          secondary: FometColors.secondary,
        ),
        useMaterial3: true,
      ),

      // Route management
      routerConfig: appRouter,

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Hides scroll bars on mobile but always shows them on desktop
      scrollBehavior: const _CustomScrollBehavior(),

      // Hiding the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

/// This custom implementation of [MaterialScrollBehavior] makes the scroll bar
/// **always** visible on desktop platforms.
///
/// On mobile devices, the scroll bar never appears.
class _CustomScrollBehavior extends MaterialScrollBehavior {
  /// Creates a [_CustomScrollBehavior] configuration.
  const _CustomScrollBehavior();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // No scroll bars in the horizontal axis
    if (axisDirectionToAxis(details.direction) == Axis.horizontal) {
      return child;
    }

    // Show scroll bars when scrolling vertically but only on desktop. This part
    // can be ignored by code coverage because it's tested in integration tests.
    switch (Theme.of(context).platform) {
      // coverage:ignore-start
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return Scrollbar(
          controller: details.controller,
          thumbVisibility: true,
          child: child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return child;
      // coverage:ignore-end
    }
  }
}
