import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// The default widget used by [FometFutureBuilder] when the future completes
/// with an error.
class LoadingErrorWidget extends StatelessWidget {
  /// Creates a [LoadingErrorWidget] widget.
  const LoadingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8),
            child: Text(
              context.l10n.errorWidgetTitle,
              style: FometTypography.semiBold.copyWith(
                color: FometColors.secondaryText,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            context.l10n.errorWidgetSubitle,
            style: FometTypography.regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
