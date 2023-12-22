import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

class ListEntryItem extends StatelessWidget {
  final Widget text;
  final int value;
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
