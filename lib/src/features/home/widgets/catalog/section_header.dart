import 'package:flutter/material.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? backButtonTap;
  final VoidCallback? closeButtonTap;
  const SectionHeader({
    required this.title,
    this.backButtonTap,
    this.closeButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: backButtonTap,
            icon: const Icon(
              Icons.arrow_back,
              size: 16,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  title,
                  style: FometTypography.bold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: closeButtonTap ?? () => context.go(homePagePath),
            icon: const Icon(
              Icons.close,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}