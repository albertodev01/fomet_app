import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/common/tokens.dart';

/// A widget with an interactive icon and a label underneath that is used by
/// [FometBottomNavigationBar].
///
/// The icon color changes when [index] has the same value as [selectedIndex].
class BottomNavigationItem extends StatelessWidget {
  /// The index of the currently selected item in the [FometBottomNavigationBar]
  /// widget.
  final ValueNotifier<int> selectedIndex;

  /// This item's index.
  final int index;

  /// The text underneath [iconData].
  final String text;

  /// The icon above [text].
  final IconData iconData;

  /// Creates a [BottomNavigationItem] widget.
  const BottomNavigationItem({
    required this.selectedIndex,
    required this.index,
    required this.text,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, currentIndex, _) {
            return Icon(
              iconData,
              size: FometDimensions.space3x,
              color: index == currentIndex
                  ? FometColors.primary
                  : FometColors.inactiveText,
            );
          },
        ),
        const SizedBox(
          height: FometBottomNavigationTokens.buttonItemInnerSpace,
        ),
        Text(
          text,
          style: FometTypography.light.copyWith(
            color: FometColors.inactiveText,
          ),
        ),
      ],
    );
  }
}
