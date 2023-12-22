import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

class BottomNavigationItem extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  final int index;
  final String text;
  final IconData iconData;
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
              size: 24,
              color: index == currentIndex ? FometColors.primary : Colors.grey,
            );
          },
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: FometTypography.light.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
