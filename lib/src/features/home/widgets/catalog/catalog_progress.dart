import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Used at the bottom of [CatalogPage] to let the user know which items have
/// been selected through the various steps.
class CatalogProgress extends StatelessWidget {
  /// Creates a [CatalogProgress] widget.
  const CatalogProgress({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuilds the staps with the user selected items.
    final state = context.catalogState;

    // Separates text with an icon.
    const separator = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Icon(
        Icons.chevron_right_outlined,
        color: FometColors.primary,
        size: 14,
      ),
    );

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
                separator,
                _ProgressEntry(
                  text: state.variety.description,
                  placeholder: context.l10n.variety,
                ),
                separator,
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

/// Used by [CatalogProgress] for showing a progress entry.
class _ProgressEntry extends StatelessWidget {
  /// The text.
  final String text;

  /// The placeholder that replaces [text] when epty.
  final String placeholder;

  /// Creates a [_ProgressEntry] widget.
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
