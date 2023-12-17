import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

class FometCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  const FometCard({
    required this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: FometColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: FometTypography.regular.copyWith(
                color: FometColors.primaryText,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(
                height: 8,
              ),
              Text(
                subtitle!,
                style: FometTypography.semiBold.copyWith(
                  color: FometColors.secondaryText,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
