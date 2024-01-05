import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_details_view.dart';
import 'package:fomet_app/src/features/products/pages/product_details_page.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// This widget is used by [ProductsDetailsView] and [ProductsDetailsPage] to
/// show the details of the [productInfo] object.
class ProductDetailsWidget extends StatefulWidget {
  /// The product info object.
  final FometCatalogProductInfo productInfo;

  /// The product code.
  final String productCode;

  /// Creates a [ProductDetailsWidget] widget.
  const ProductDetailsWidget({
    required this.productInfo,
    required this.productCode,
    super.key,
  });

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  // Loads the product image from the Fomet server.
  late final imageFuture = FometProductImageClient(
    productCode: widget.productCode,
    client: context.mockClient,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Product image
        FometFutureBuilder<Uint8List>(
          future: imageFuture,
          onSuccess: (data) {
            return Image.memory(
              data,
              height: 150,
              width: 112,
              fit: BoxFit.contain,
            );
          },
        ),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: FometDimensions.space3x,
          ),
          child: Text(
            widget.productInfo.description,
            style: FometTypography.regular,
            textAlign: TextAlign.center,
          ),
        ),

        // Information displayed in either one or more columns
        _ProductInfoTile(
          title: context.l10n.autumnFertilizer,
          value: widget.productInfo.autumnFertilizer,
        ),
        _ProductInfoTile(
          title: context.l10n.coverageFertilizer,
          value: widget.productInfo.coverageFertilizer,
        ),
        _ProductInfoTile(
          title: context.l10n.irrigationFertilizer,
          value: widget.productInfo.irrigationFertilizer,
        ),
        _ProductInfoTile(
          title: context.l10n.preSowingFertilizer,
          value: widget.productInfo.preSowingFertilizer,
        ),
        _ProductInfoTile(
          title: context.l10n.rowFertilizer,
          value: widget.productInfo.rowFertilizer,
        ),
        _ProductInfoTile(
          title: context.l10n.springFertilizer,
          value: widget.productInfo.springFertilizer,
        ),

        // Optional notes
        _Notes(
          notes: widget.productInfo.notes,
        ),
      ],
    );
  }
}

/// Used by
class _ProductInfoTile extends StatelessWidget {
  final String title;
  final String value;
  const _ProductInfoTile({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty || value == '-') {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FometDimensions.space3x,
        vertical: FometDimensions.space1x,
      ),
      child: FometCard(
        centerContents: true,
        content: Text(
          value,
          style: FometTypography.regular,
          textAlign: TextAlign.center,
        ),
        secondaryContent: Text(
          title,
          style: FometTypography.semiBold.copyWith(
            fontSize: 11,
            color: FometColors.secondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _Notes extends StatelessWidget {
  final String notes;
  const _Notes({
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const SizedBox(
        height: FometDimensions.space3x,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FometDimensions.space1x,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LogoSeparator(
            padding: EdgeInsets.symmetric(
              vertical: FometDimensions.space5x,
            ),
          ),
          Text(
            notes,
            style: FometTypography.regular,
          ),
          const SizedBox(height: FometDimensions.space3x),
        ],
      ),
    );
  }
}
