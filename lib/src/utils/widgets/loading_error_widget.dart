import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_ui/fomet_ui.dart';

class LoadingErrorWidget extends StatelessWidget {
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
