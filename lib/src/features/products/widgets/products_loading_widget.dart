import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_ui/fomet_ui.dart';

class ProductsLoadingIndicator extends StatelessWidget {
  const ProductsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            context.l10n.productsLoadingText,
            style: FometTypography.regular,
          ),
        ],
      ),
    );
  }
}
