import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';

class ProductDetailsWidget extends StatefulWidget {
  final FometCatalogProductInfo productInfo;
  final String productCode;
  const ProductDetailsWidget({
    required this.productInfo,
    required this.productCode,
    super.key,
  });

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late final imageFuture = FometProductImageClient(
    productCode: widget.productCode,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('desc = ${widget.productInfo.description}'),
        Text('autumnFertilizer = ${widget.productInfo.autumnFertilizer}'),
        Text('coverageFertilizer = ${widget.productInfo.coverageFertilizer}'),
        Text(
          'irrigationFertilizer = ${widget.productInfo.irrigationFertilizer}',
        ),
        Text('preSowingFertilizer = ${widget.productInfo.preSowingFertilizer}'),
        Text('rowFertilizer = ${widget.productInfo.rowFertilizer}'),
        Text('notes = ${widget.productInfo.notes}'),
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
  }
}
