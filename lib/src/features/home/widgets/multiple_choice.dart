import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';

class HomeOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final SvgImage image;
  const HomeOptionButton({
    required this.text,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: FometColors.primary,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: image,
            ),
            Flexible(
              child: Text(
                text,
                style: FometTypography.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
