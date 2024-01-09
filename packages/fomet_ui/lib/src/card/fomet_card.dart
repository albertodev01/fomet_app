import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/common/tokens.dart';

/// An information card component is a panel with slightly rounded corners and
/// an elevation shadow. The main content of the widget is represented by
/// [content] and below there is an optional [secondaryContent] property.
class FometCard extends StatelessWidget {
  /// The main content of the card.
  final Widget content;

  /// Optional widget that is placed below [content].
  ///
  /// By default, this is set to `null`.
  final Widget? secondaryContent;

  /// An optional icon that is placed to the right of [content].
  ///
  /// By default, this is set to `null`.
  final Widget? trailingIcon;

  /// {@template fometui.card.onTap}
  /// Called when the widget is tapped or otherwise activated.
  /// {@endtemplate}
  final VoidCallback? onTap;

  /// Whether centring [content] and [secondaryContent].
  ///
  /// By default, this is set to `false`.
  final bool centerContents;

  /// Optional padding around the card.
  ///
  /// By default, this is set to [EdgeInsets.zero].
  final EdgeInsets padding;

  /// Creates a [FometCard] widget.
  const FometCard({
    required this.content,
    this.onTap,
    this.trailingIcon,
    this.secondaryContent,
    this.centerContents = false,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // By default, there is no trailing widget
    Widget trailing = const SizedBox.shrink();

    // If there is a trailing widget, we want to add some padding
    if (trailingIcon != null) {
      trailing = Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: FometDimensions.space1x,
        ),
        child: trailingIcon,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Card(
          elevation: FometCardTokens.elevation,
          shadowColor: FometColors.primary,
          color: FometCardTokens.backgroundColor,
          surfaceTintColor: FometCardTokens.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FometDimensions.space2x,
              vertical: FometDimensions.space1x,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: centerContents
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: centerContents
                            ? Alignment.center
                            : Alignment.centerLeft,
                        child: content,
                      ),
                    ),
                    trailing,
                  ],
                ),
                if (secondaryContent != null) ...[
                  const SizedBox(
                    height: FometDimensions.space1x,
                  ),
                  secondaryContent!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
