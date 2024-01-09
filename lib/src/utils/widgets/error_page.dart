import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
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
      body: CenteredScrollableContent(
        children: [
          const LogoSvg(
            height: FometDimensions.large,
            width: FometDimensions.large,
          ),
          const SizedBox(height: 20),
          const _NotFoundText(),
          const SizedBox(height: 40),
          FometButton(
            onTap: () => context.go(homePagePath),
            leadingIcon: const Icon(
              Icons.home,
              color: FometColors.primary,
              size: FometDimensions.space3x,
            ),
            text: context.l10n.home,
          ),
        ],
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
      style: FometTypography.regular.copyWith(
        fontSize: 16,
      ),
    );
  }
}
