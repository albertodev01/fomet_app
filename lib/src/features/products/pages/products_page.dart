import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/widgets/products_loading_widget.dart';
import 'package:fomet_app/src/features/products/widgets/products_result.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

/// The products page shows a filterable list of all Fomet products. Each entry
/// can be tapped to see the details of the selected product.
class ProductsPage extends StatefulWidget {
  /// {@macro fomet_app.pages.mockClient}
  final FometMockClient? mockClient;

  /// Creates a [ProductsPage] widget.
  const ProductsPage({
    this.mockClient,
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final future = FometProductsClient(
    languageCode: context.languageCode,
    client: widget.mockClient,
  ).execute();

  @override
  Widget build(BuildContext context) {
    // If the products list was cached, we return it immediately to avoid making
    // the HTTP request.
    if (context.productsPageState.products.isNotEmpty) {
      return ProductsResult(
        products: context.productsPageState.products,
      );
    }

    return FometFutureBuilder<List<FometProduct>>(
      future: future,
      loadingWidget: const ProductsLoadingIndicator(),
      onSuccess: (data) {
        // This is for caching products so that they won't be fetched multiple
        // times when the application is opnened.
        context.productsPageState.products = data;

        return ProductsResult(products: data);
      },
    );
  }
}
