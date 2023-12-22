import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

class SideNavigationItem extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  final int index;
  final String text;
  final IconData iconData;
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
        horizontal: 24,
        vertical: 12,
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, currentIndex, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 46,
            decoration: BoxDecoration(
              border: index == currentIndex
                  ? Border.all(color: FometColors.primary)
                  : null,
              borderRadius: BorderRadius.circular(58),
            ),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          child: Row(
            children: [
              ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, currentIndex, _) {
                  return Icon(
                    iconData,
                    size: 24,
                    color: index == currentIndex
                        ? FometColors.primary
                        : Colors.grey,
                  );
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  style: FometTypography.light.copyWith(
                    color: Colors.grey,
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
