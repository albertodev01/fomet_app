import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/common/tokens.dart';

/// A widget with an icon, a label on the right and and interactive border that
/// is used by [FometSideNavigationBar].
///
/// The border color changes when [index] has the same value as [selectedIndex].
class SideNavigationItem extends StatelessWidget {
  /// The index of the currently selected item in the [FometSideNavigationBar]
  /// widget.
  final ValueNotifier<int> selectedIndex;

  /// This item's index.
  final int index;

  /// The text next to [iconData].
  final String text;

  /// The icon to the left of [text].
  final IconData iconData;

  /// Creates a [SideNavigationItem] widget.
  const SideNavigationItem({
    required this.selectedIndex,
    required this.index,
    required this.text,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FometDimensions.space3x,
        vertical: FometDimensions.small,
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, currentIndex, child) {
          // The container around the button animates the border color when it
          // changes.
          return AnimatedContainer(
            duration: FometSideNavigationTokens.borderColorDuration,
            height: FometDimensions.space6x,
            decoration: BoxDecoration(
              border: index == currentIndex
                  ? Border.all(color: FometColors.primary)
                  : null,
              borderRadius: BorderRadius.circular(FometDimensions.space6x),
            ),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: FometDimensions.small,
            vertical: FometDimensions.space1x,
          ),
          child: Row(
            children: [
              ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, currentIndex, _) {
                  return Icon(
                    iconData,
                    size: FometDimensions.space3x,
                    color: index == currentIndex
                        ? FometColors.primary
                        : Colors.grey,
                  );
                },
              ),
              const SizedBox(width: FometDimensions.space1x),
              Expanded(
                child: Text(
                  text,
                  style: FometTypography.light.copyWith(
                    color: FometColors.inactiveText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
