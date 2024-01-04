import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/about/pages/about_page.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A custom widget for a numbered list item. Used in [AboutPage].
///
/// The [value] is placed to the left side of the widget while [text] takes the
/// remaining space.
class ListEntryItem extends StatelessWidget {
  /// The text next to [value].
  final Widget text;

  /// This value is located on the right side of the widget, before [text].
  final int value;

  /// Creates a [ListEntryItem] widget.
  const ListEntryItem({
    required this.text,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 16, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$value.',
            style: FometTypography.bold.copyWith(
              color: FometColors.secondaryText,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: text),
        ],
      ),
    );
  }
}
