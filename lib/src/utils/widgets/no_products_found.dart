import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_view.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Used by [ProductsView] and [ProductsPage] to tell the user that no products
/// were found.
class NoProductsFound extends StatelessWidget {
  /// Creates a [NoProductsFound] widget.
  const NoProductsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CenteredScrollableContent(
      children: [
        const Icon(
          Icons.production_quantity_limits,
          size: 32,
          color: FometColors.primary,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Text(
            context.l10n.noProductsFound,
            style: FometTypography.regular.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
