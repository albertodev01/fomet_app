import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// Used inside [ProductsPage] to show a filterable list of all Fomet products.
class ProductsResult extends StatelessWidget {
  /// The products list.
  final List<FometProduct> products;

  /// Creates a [ProductsResult] widget.
  const ProductsResult({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final element = products[index];

        return FometCard(
          onTap: () {
            context.productsPageState.selectedProduct = element;
            context.go('$productsPagePath/$productDetailsPath');
          },
          padding: const EdgeInsets.symmetric(
            vertical: FometDimensions.space2x,
          ),
          content: Text(
            element.description,
            style: FometTypography.regular,
          ),
          secondaryContent: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SecondaryContent(
                title: context.l10n.category,
                value: element.categoryDescription,
              ),
              const SizedBox(height: 8),
              _SecondaryContent(
                title: context.l10n.variety,
                value: element.varietyDescription,
              ),
            ],
          ),
          trailingIcon: const Icon(
            Icons.chevron_right,
            color: FometColors.secondary,
          ),
        );
      },
    );
  }
}

/// The secondary content of a [FometCard] widget in the list.
class _SecondaryContent extends StatelessWidget {
  /// The property titile.
  final String title;

  /// The property value.
  final String value;

  /// Creates a [_SecondaryContent] widget.
  const _SecondaryContent({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: FometTypography.semiBold.copyWith(
          color: FometColors.primary,
        ),
        children: [
          TextSpan(
            text: value,
            style: FometTypography.regular,
          ),
        ],
      ),
    );
  }
}
