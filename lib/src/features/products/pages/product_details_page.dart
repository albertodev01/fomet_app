import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_app/src/utils/widgets/product_details_widget.dart';
import 'package:go_router/go_router.dart';

class ProductsDetailsPage extends StatefulWidget {
  const ProductsDetailsPage({super.key});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  late final future = FometProductInfoClient(
    categoryCode: context.productsPageState.selectedProduct!.categoryCode,
    varietyCode: context.productsPageState.selectedProduct!.varietyCode,
    productCode: context.productsPageState.selectedProduct!.code,
    languageCode: context.languageCode,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.products,
          closeButtonTap: () => context.go(productsPagePath),
        ),
        Expanded(
          child: FometFutureBuilder<FometCatalogProductInfo>(
            future: future,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onSuccess: (data) => ProductDetailsWidget(
              productInfo: data,
              productCode: context.productsPageState.selectedProduct!.code,
            ),
          ),
        ),
      ],
    );
  }
}
