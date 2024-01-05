import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/widgets/products_result.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final future = FometProductsClient(
    languageCode: context.languageCode,
  ).execute();

  @override
  Widget build(BuildContext context) {
    if (context.productsPageState.products.isNotEmpty) {
      return ProductsResult(
        products: context.productsPageState.products,
      );
    }

    return FometFutureBuilder<List<FometProduct>>(
      future: future,
      onSuccess: (data) => ProductsResult(products: data),
    );
  }
}
