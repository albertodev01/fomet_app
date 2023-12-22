import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/app_router.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// The application's main entrypoint.
void main() {
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

      // Hiding the debug banner
      debugShowCheckedModeBanner: false,

      // Unique restoration id
      restorationScopeId: 'fomet-app',
    );
  }
}
