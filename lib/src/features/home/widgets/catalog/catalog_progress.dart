import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_ui/fomet_ui.dart';

class CatalogProgress extends StatelessWidget {
  const CatalogProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.catalogState;

    return SizedBox(
      height: 56,
      child: Center(
        child: ListenableBuilder(
          listenable: state,
          builder: (context, _) {
            return Row(
              children: [
                _ProgressEntry(
                  text: state.category.description,
                  placeholder: context.l10n.category,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Icon(
                    Icons.chevron_right_outlined,
                    color: FometColors.primary,
                    size: 14,
                  ),
                ),
                _ProgressEntry(
                  text: state.variety.description,
                  placeholder: context.l10n.variety,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Icon(
                    Icons.chevron_right_outlined,
                    color: FometColors.primary,
                    size: 14,
                  ),
                ),
                _ProgressEntry(
                  text: state.kind.description,
                  placeholder: context.l10n.kind,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProgressEntry extends StatelessWidget {
  final String text;
  final String placeholder;
  const _ProgressEntry({
    required this.text,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            placeholder,
            style: FometTypography.captionSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          text,
          style: FometTypography.regular.copyWith(
            fontSize: 13,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
