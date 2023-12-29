import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// This widget is associated to the [errorPagePath] route and is displayed when
/// an error occurs. For example, [ErrorWidget] is shown when an unknown route
/// is pushed via deep link.
class ErrorPage extends StatelessWidget {
  /// Creates an [ErrorPage] widget.
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoSvg(),
              const SizedBox(height: 20),
              const _NotFoundText(),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => context.go(homePagePath),
                child: const Text('Back to home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotFoundText extends StatelessWidget {
  const _NotFoundText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.pageNotFoundText,
      style: FometTypography.medium,
    );
  }
}
