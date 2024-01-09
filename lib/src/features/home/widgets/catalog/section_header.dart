import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// A widget used by [PageView] children inside [CatalogPage] as navigation bar.
/// The [title] is shown at the center; [backButtonTap] and [closeButtonTap] are
/// optional an placed at the edges.
class SectionHeader extends StatelessWidget {
  /// The title at the center.
  final String title;

  /// When defined, this callback is associated to an [IconButton] to the right
  /// of [title].
  ///
  /// By defult, this is set to `null` and the button is disabled.
  final VoidCallback? backButtonTap;

  /// Allows overriding the default behavior of the back button to the left of
  /// [title].
  final VoidCallback? closeButtonTap;

  /// Creates a [SectionHeader] widget.
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
