import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A widget with a [CircularProgressIndicator] and a loading message that is
/// used by [ProductsPage] while products are being fetched.
class ProductsLoadingIndicator extends StatelessWidget {
  /// Creates a [ProductsLoadingIndicator] widget.
  const ProductsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CenteredScrollableContent(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          context.l10n.productsLoadingText,
          style: FometTypography.regular,
        ),
      ],
    );
  }
}
