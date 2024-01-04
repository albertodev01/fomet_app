import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_details_view.dart';
import 'package:fomet_app/src/features/products/pages/product_details_page.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
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
            );
          },
        ),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: FometDimensions.space1x,
            vertical: FometDimensions.space3x,
          ),
          child: Text(
            widget.productInfo.description,
            style: FometTypography.regular,
          ),
        ),
        Text('autumnFertilizer = ${widget.productInfo.autumnFertilizer}'),
        Text('coverageFertilizer = ${widget.productInfo.coverageFertilizer}'),
        Text(
          'irrigationFertilizer = ${widget.productInfo.irrigationFertilizer}',
        ),
        Text('preSowingFertilizer = ${widget.productInfo.preSowingFertilizer}'),
        Text('rowFertilizer = ${widget.productInfo.rowFertilizer}'),
        Text('notes = ${widget.productInfo.notes}'),
      ],
    );
  }
}
