import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';

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
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LogoSvg(),
              SizedBox(height: 20),
              _NotFoundText(),
              SizedBox(height: 40),
              Text('Back to home'),
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
