import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

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
  final VoidCallback onTap;

  /// Creates a [FometCard] widget.
  const FometCard({
    required this.content,
    required this.onTap,
    this.trailingIcon,
    this.secondaryContent,
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
      child: Card(
        elevation: 2,
        shadowColor: FometColors.primary,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: FometDimensions.space2x,
            vertical: FometDimensions.space1x,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(child: content),
                  trailing,
                ],
              ),
              const SizedBox(
                height: FometDimensions.space1x,
              ),
              secondaryContent ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
