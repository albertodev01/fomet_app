import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_title.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';

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

  late final imageFuture = FometProductImageClient(
    productCode: context.catalogState.product.code,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CatalogHeader(
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
            onSuccess: (data) {
              return ListView(
                children: [
                  Text('desc = ${data.description}'),
                  Text('autumnFertilizer = ${data.autumnFertilizer}'),
                  Text('coverageFertilizer = ${data.coverageFertilizer}'),
                  Text('irrigationFertilizer = ${data.irrigationFertilizer}'),
                  Text('preSowingFertilizer = ${data.preSowingFertilizer}'),
                  Text('rowFertilizer = ${data.rowFertilizer}'),
                  Text('notes = ${data.notes}'),
                  FometFutureBuilder<Uint8List>(
                    future: imageFuture,
                    onSuccess: (data) {
                      return Image.memory(
                        data,
                        height: 150,
                        width: 112,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
