import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/product_details_widget.dart';

class ProductsDetailsView extends StatefulWidget {
  final PageController controller;
  const ProductsDetailsView({
    required this.controller,
    super.key,
  });

  @override
  State<ProductsDetailsView> createState() => _ProductsDetailsViewState();
}

class _ProductsDetailsViewState extends State<ProductsDetailsView> {
  late final future = FometProductInfoClient(
    categoryCode: context.catalogState.category.code,
    varietyCode: context.catalogState.variety.code,
    productCode: context.catalogState.product.code,
    languageCode: context.languageCode,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.products,
          backButtonTap: () async => widget.controller.animateToPage(
            3,
            duration: const Duration(milliseconds: 600),
            curve: Curves.linear,
          ),
        ),
        Expanded(
          child: FometFutureBuilder<FometCatalogProductInfo>(
            future: future,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onSuccess: (data) => ProductDetailsWidget(
              productInfo: data,
              productCode: context.catalogState.product.code,
            ),
          ),
        ),
      ],
    );
  }
}
